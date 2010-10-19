From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] Allow nodes at the root to be specified by path as
	well as by label.
Date: Tue, 19 Oct 2010 13:33:24 +1100
Message-ID: <20101019023324.GB24726@yookeroo>
References: <20101018202353.24286.74857.stgit@riker>
	<20101018202540.24286.12690.stgit@riker>
	<20101018205034.GE2259@angua.secretlab.ca>
	<AANLkTimi_w-3pd9U6mKj5A78RzOp2KdBvh3fqgNTFBqH@mail.gmail.com>
	<20101018215143.GC3337@angua.secretlab.ca>
	<AANLkTimT6WaCDgLM-cqEvrUqTmeDDohOGEgxDXjxssPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimT6WaCDgLM-cqEvrUqTmeDDohOGEgxDXjxssPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 18, 2010 at 04:36:14PM -0700, John Bonesio wrote:
> It seems we have conflicting syntax for path references and label
> references.
> 
> Here's what we have now:
> 
> &label
> &{/path/to/the/node}
> 
> It's not a problem until we want to combine them. If we want a path rooted
> at label suddenly there is the question of the curly braces. What should we
> have?
> 
> &label{/path/to/the/subnode/}
> &{label/path/to/the/subnode/}
> &label/path/to/the/subnode

Yeah, I've been thinking about this myself.

> In looking at the dtc code, it appears that '&' is only used to reference
> exising nodes. So I don't think the curly braces are necessary.
> 
> How about we do the following:
> 
>    1. deprecate &{/path/to/the/node/} - if it's not used anywhere, can just
>    remove the code and not worry about deprecating it

>    2. use the following to reference nodes:
> 
> &label   /* just refers to a labeled node */
> &/path/to/the/node /* refers to a node by it's path */

Absolutely not.  We got rid of bare &/path/to/node when we went from
dts-v0 to dts-v1 for good reason.

The problem is that node (and property) names can contain all manner
of strange characters, including things that would usually be
separators or delimiters.  To sanely lex and parse this, they can only
be recognized in special lexical contexts, and not just anywhere -
such as where references can appear.  The extra { } delimiters serve
to introduce the special lexical context which can recognize bare node
names, and therefore a full path.

That gives us several options:

	1) &{label/path/to/subnode}

Good: Very straightforward to implement

Bad:  Mild conflict with OF conventions, where you'd expect an alias
as the first element
      Is &{label} prohibited or just equivalent to &label.  First is
an odd exception, second means we have two ways of doing something for
non-obvious reason.


	2) &label{/path/to/subnode}

Good: Nice orthogonality; a reference is always &[<label>][{<path>}]

Bad: leading / suggests an absolute path, which it isn't
     potentially nasty ambiguity with the currently legal construct
		&label{property="something;};
(i.e. does the {} introduce a reference path, or the beginning of the 
path or the actual node block)

	3) &label{path/to/subnode}

Good: relative path gives right hint to reader
      nearly as orthogonal

Bad: same ambiguity as above

	3) Always allow relative paths rather than single component to
introduce a node block, thus allowing:

&label {
	path/to/subnode {
		new-property;
	};
};

Good: avoids grammatical ambiguities
      may have uses other than with labels

Bad: more verbose
     requires per-subtree rather than per toplevel-tree
remove/replace attributes

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
