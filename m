From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: node reference: path from a label
Date: Sat, 23 Oct 2010 16:14:31 -0700
Message-ID: <1287875671.4535.1578.camel@riker>
References: <20101018202353.24286.74857.stgit@riker>
	<20101018202540.24286.12690.stgit@riker>
	<20101018205034.GE2259@angua.secretlab.ca>
	<AANLkTimi_w-3pd9U6mKj5A78RzOp2KdBvh3fqgNTFBqH@mail.gmail.com>
	<20101018215143.GC3337@angua.secretlab.ca>
	<AANLkTimT6WaCDgLM-cqEvrUqTmeDDohOGEgxDXjxssPQ@mail.gmail.com>
	<20101019023324.GB24726@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101019023324.GB24726@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I was talking to Grant Likely a bit about the path from a label syntax,
and we came to what we thought was a good solution. I was supposed to
propose it with another patch submission, but now I'm rethinking this. I
thought I'd go into detail on the problem so we might all work together
to come to a good solution.

My concern here is we'll end up doing what happened with the Perl
language. In Perl they started out with a good functional scripting
language, but then later adopted an object oriented approach along with
other new features. Eventually it got to where certain syntax didn't
work with other syntax. It is legal syntax, but doesn't produce the
expected results, because the combination could have multiple meanings.
In my opinion, the design of that language is now broken, and in face a
newer version of this language is being worked on which will break
backward compatibility with existing code (even the developers recognize
the problem).

A part of our problem is that we are trying to make a syntax for 'path
from a label' in the context of an undefined syntax for 'path from an
alias'. It makes discussion of 'path from a label' difficult because I'm
trying to fit it in with a 'path from an alias' syntax that is in
people's heads.

I think we need to talk about how we might implement path from an alias
so that we can talk concretely about whole concept of how we want to
specify references to nodes.

(Syntax #1)
When Grant and I chatted, we can come to the following:
	& - means reference

	&{&label/path/from/label}
	&{alias/path/from/alias}  (future syntax)
	&{/path/to/node}
	&label
	&{alias}
	&{/}


As I thought about it, the problem with this is that the syntax requires
differing contexts to resolve what '&' means.

We have &{&label/path/from/label} to mean reference the labeled node
first, then resolve the rest of the path reference from there (sort of a
nested referencing).

So then what do we do with the alias? We stared with
&{alias/path/from/alias}. But then in the syntax it doesn't look like
we're referencing the alias node like we would for the label node, we're
just sticking the alias name in there. So the label and the alias don't
appear to be treated the same.

Perhaps we could add a different character to mean reference to an
alias, perhaps %alias. 
(Syntax #1a)
So we use
	&{%alias/path/from/alias}.

With this approach we have 3 syntaxes to specify a refernce;
	&label - reference to label
	%alias - reference to an alias.
	&{/path/to/node}
	&{&label/path/to/node}
	&{%alias/path/to/node}

It could work, but we have multiple syntaxes to reference nodes
depending on if by label or alias. Or depending on how you look at it,
we have '&' meaning label identifier or reference to node depending.

Some of the other suggestions:

(Syntax #2)
As David Gibson suggested we could have:
&label{/path/from/label}
or
&label{path/from/label}

Both of these still begs the question of what we do with the path from
an alias. Do we use the following?
	&{alias/path/from/alias}

To the casual observer, they probably will be wondering why the label is
treated so differently from the alias when conceptually they're so
similar? I might also be hard to for dts writers to remember which
syntax to use for the label vs the alias.

(Syntax #3)
Another syntax was proposed:
	&label {
		    path/to/subnode {
		            new-property;
		    };
	};

So what would do to reference from an alias?
	&{alias/path/from/alias}
	
Again we end up with very different methods to do very similar things
depending on if the start of the reference is an alias or a label.

(Syntax #4 - My actual proposal here)
For this syntax (below) to work, we need to set up some semantics first.
The first rule is this:
Every alias defined in the dts file also defines a label with the same
name on the aliased node.

>From tests/aliases.dts:
/ {
        aliases {
                s1 = &sub1;
                ss1 = &subsub1;
                sss1 = &subsubsub1;
        };

        sub1: subnode@1 {
                compatible = "subnode1";

                subsub1: subsubnode {
                        compatible = "subsubnode1", "subsubnode";

                        subsubsub1: subsubsubnode {
                                compatible = "subsubsubnode1",
"subsubsubnode";
                        };
                };
        };
};

In the above example, /subnode@1 ends up having labels: &sub1 and &s1.
The aliases nodes still exist in the tree for referencing at run time.

If desired, aliases can re-use label names. For example the following is
valid:

	aliases {
                sub1 = &sub1;
        };

In this case, an alias node is created for 'sub1', and the label on
subnode@1 is just &sub1.

With these semantics, then we only need a syntax for the following:
	* reference by label
	* reference by path
	* reference a path from a label (also covers path from an alias)

And we can use the following syntax:
	&label (syntactic shortcut for &{label})
	&{label}
	&{/path/to/a/node}
	&{label/path/from/label}

With this '&' always means reference, and a reference to a path from an
alias is built in by the semantics.

For this, we will probably want to go ahead and implement the label
semantics on an alias to make sure we don't forget all this and do
something unintended. Or we can just document it somewhere where we're
sure to see it.

(Syntax #5)
I think other options would have to include deprecating some or all of
the current syntax. This might include deprecating
	&{/path/to/node}
	
So that we can make '&label' always be just a label identifier and then
have something else to mean reference (maybe '%'). Then we'd have to
have something else that means alias identifier (maybe '$'). This would
produce something like
	%{&label}
	%{/path/to/node}
	%{&label/path/to/node}
	%{$alias/path/to/node}

I haven't had much time to work through the details on this one, and
there might be other options for what syntax we keep and what we
deprecate.

Thoughts?
