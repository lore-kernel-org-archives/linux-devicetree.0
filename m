From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: node reference: path from a label
Date: Tue, 2 Nov 2010 00:42:04 -0400
Message-ID: <AANLkTikc8SdEa_3BUuwaXz9rkwjKY4EVkWw+1ATVGnfJ@mail.gmail.com>
References: <20101018202353.24286.74857.stgit@riker>
	<20101018202540.24286.12690.stgit@riker>
	<20101018205034.GE2259@angua.secretlab.ca>
	<AANLkTimi_w-3pd9U6mKj5A78RzOp2KdBvh3fqgNTFBqH@mail.gmail.com>
	<20101018215143.GC3337@angua.secretlab.ca>
	<AANLkTimT6WaCDgLM-cqEvrUqTmeDDohOGEgxDXjxssPQ@mail.gmail.com>
	<20101019023324.GB24726@yookeroo> <1287875671.4535.1578.camel@riker>
	<20101025042651.GB4741@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101025042651.GB4741@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 25, 2010 at 12:26 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sat, Oct 23, 2010 at 04:14:31PM -0700, John Bonesio wrote:
>> Hi,
>>
>> I was talking to Grant Likely a bit about the path from a label syntax,
>> and we came to what we thought was a good solution. I was supposed to
>> propose it with another patch submission, but now I'm rethinking this. I
>> thought I'd go into detail on the problem so we might all work together
>> to come to a good solution.
>>
>> My concern here is we'll end up doing what happened with the Perl
>> language. In Perl they started out with a good functional scripting
>> language, but then later adopted an object oriented approach along with
>> other new features. Eventually it got to where certain syntax didn't
>> work with other syntax. It is legal syntax, but doesn't produce the
>> expected results, because the combination could have multiple meanings.
>
> Right, I'm also concerned about keeping the syntax clean, which is
> exactly why I'm always so difficult when new syntax is proposed.
>
>> In my opinion, the design of that language is now broken, and in face a
>> newer version of this language is being worked on which will break
>> backward compatibility with existing code (even the developers recognize
>> the problem).
>
> Well, sure. =A0Of course, Perl had about a zillion times more complexity
> than dtc to begin with..
>
>> A part of our problem is that we are trying to make a syntax for 'path
>> from a label' in the context of an undefined syntax for 'path from an
>> alias'. It makes discussion of 'path from a label' difficult because I'm
>> trying to fit it in with a 'path from an alias' syntax that is in
>> people's heads.
>>
>> I think we need to talk about how we might implement path from an alias
>> so that we can talk concretely about whole concept of how we want to
>> specify references to nodes.
>>
>> (Syntax #1)
>> When Grant and I chatted, we can come to the following:
>> =A0 =A0 =A0 & - means reference
>>
>> =A0 =A0 =A0 &{&label/path/from/label}
>
> This one occurred to me, but I really dislike the double & for reasona
> I'll go into below.
>
>> =A0 =A0 =A0 &{alias/path/from/alias} =A0(future syntax)
>
> Not so much future syntax as existing syntax from contexts other than dtc.
>
>> =A0 =A0 =A0 &{/path/to/node}
>> =A0 =A0 =A0 &label
>> =A0 =A0 =A0 &{alias}
>> =A0 =A0 =A0 &{/}
>>
>>
>> As I thought about it, the problem with this is that the syntax requires
>> differing contexts to resolve what '&' means.
>
> I'm not sure what you mean by that.
>
>> We have &{&label/path/from/label} to mean reference the labeled node
>> first, then resolve the rest of the path reference from there (sort of a
>> nested referencing).
>>
>> So then what do we do with the alias? We stared with
>> &{alias/path/from/alias}. But then in the syntax it doesn't look like
>> we're referencing the alias node like we would for the label node, we're
>> just sticking the alias name in there. So the label and the alias don't
>> appear to be treated the same.
>
> Yeah, I agree.
>
>>
>> Perhaps we could add a different character to mean reference to an
>> alias, perhaps %alias.
>> (Syntax #1a)
>> So we use
>> =A0 =A0 =A0 &{%alias/path/from/alias}.
>>
>> With this approach we have 3 syntaxes to specify a refernce;
>> =A0 =A0 =A0 &label - reference to label
>> =A0 =A0 =A0 %alias - reference to an alias.
>> =A0 =A0 =A0 &{/path/to/node}
>> =A0 =A0 =A0 &{&label/path/to/node}
>> =A0 =A0 =A0 &{%alias/path/to/node}
>>
>> It could work, but we have multiple syntaxes to reference nodes
>> depending on if by label or alias. Or depending on how you look at it,
>> we have '&' meaning label identifier or reference to node depending.
>
> Ugh, yuck, yuck, yuck.
>
>> Some of the other suggestions:
>>
>> (Syntax #2)
>> As David Gibson suggested we could have:
>> &label{/path/from/label}
>> or
>> &label{path/from/label}
>>
>> Both of these still begs the question of what we do with the path from
>> an alias. Do we use the following?
>
> (Off Topic Pet Peeve: =A0That's not what begging the question means
> http://en.wikipedia.org/wiki/Begging_the_question)
>
>> =A0 =A0 =A0 &{alias/path/from/alias}
>
> Yes, in this context that's the only thing that makes sense, because
> it's precisely "alias/path/from/alias" which is the syntax already
> used in IEEE1275 and libfdt.
>
>> To the casual observer, they probably will be wondering why the label is
>> treated so differently from the alias when conceptually they're so
>> similar? I might also be hard to for dts writers to remember which
>> syntax to use for the label vs the alias.
>
> Yes, a very valid point.
>
>> (Syntax #3)
>> Another syntax was proposed:
>> =A0 =A0 =A0 &label {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 path/to/subnode {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new-property;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 };
>>
>> So what would do to reference from an alias?
>> =A0 =A0 =A0 &{alias/path/from/alias}
>>
>> Again we end up with very different methods to do very similar things
>> depending on if the start of the reference is an alias or a label.
>
> This version bothers me less in this way than the other, though I'm
> not sure why. =A0However it raises other issues with the semantics of
> node deletion.
>
>> (Syntax #4 - My actual proposal here)
>> For this syntax (below) to work, we need to set up some semantics first.
>> The first rule is this:
>> Every alias defined in the dts file also defines a label with the same
>> name on the aliased node.
>
> That's a good basic concept, given the similarity. =A0For other reasons
> I've considered in the past doing this roughly backwards - defining a
> special label syntax which automatically adds a matching alias, e.g.
> =A0 =A0 =A0 =A0label: node {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0};
> defines a plain label, whereas:
> =A0 =A0 =A0 =A0label:: node {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0};
> defines the same label, and also adds a matching alias.
>
>> >From tests/aliases.dts:
>> / {
>> =A0 =A0 =A0 =A0 aliases {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s1 =3D &sub1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ss1 =3D &subsub1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sss1 =3D &subsubsub1;
>> =A0 =A0 =A0 =A0 };
>>
>> =A0 =A0 =A0 =A0 sub1: subnode@1 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subnode1";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsub1: subsubnode {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "subsubno=
de1", "subsubnode";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 subsubsub1: subsubsubnod=
e {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatib=
le =3D "subsubsubnode1",
>> "subsubsubnode";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 };
>> };
>>
>> In the above example, /subnode@1 ends up having labels: &sub1 and &s1.
>> The aliases nodes still exist in the tree for referencing at run time.
>
> Obviously.
>
>> If desired, aliases can re-use label names. For example the following is
>> valid:
>>
>> =A0 =A0 =A0 aliases {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sub1 =3D &sub1;
>> =A0 =A0 =A0 =A0 };
>>
>> In this case, an alias node is created for 'sub1', and the label on
>> subnode@1 is just &sub1.
>
> Ok.
>
>> With these semantics, then we only need a syntax for the following:
>> =A0 =A0 =A0 * reference by label
>> =A0 =A0 =A0 * reference by path
>> =A0 =A0 =A0 * reference a path from a label (also covers path from an al=
ias)
>>
>> And we can use the following syntax:
>> =A0 =A0 =A0 &label (syntactic shortcut for &{label})
>> =A0 =A0 =A0 &{label}
>> =A0 =A0 =A0 &{/path/to/a/node}
>> =A0 =A0 =A0 &{label/path/from/label}
>>
>> With this '&' always means reference, and a reference to a path from an
>> alias is built in by the semantics.
>>
>> For this, we will probably want to go ahead and implement the label
>> semantics on an alias to make sure we don't forget all this and do
>> something unintended. Or we can just document it somewhere where we're
>> sure to see it.
>
> Alrighty. =A0Best idea so far, by far. =A0I can see two difficulties, one
> minor, one curly.
>
> The minor one is that an alias name - being a property name - is
> technically permitted to contain a whole bunch of weird characters
> that are not valid in labels. =A0So we'd probably to have to have an odd
> edge case where an alias does not create a label if it contains bad
> characters. =A0Since aliases in practice don't contain weird characters,
> I don't think that's overly problematic, especially since we could add
> a warning if there are any properties in /aliases with bad names.
>
> The curlier problem (in the sense of harder to analyze rather than
> necessarily bad) is the question of lifetimes and scope. =A0At present
> labels are kind of "out of band" and have global scope. =A0They can be
> referenced either before or after their definition, and have a single
> well defined meaning over the whole input file.
>
> With node / property removals we've already raised the question of
> what happens to labels on them. =A0If the labels disappear with their
> node then they no longer have a guaranteed uniform meaning across the
> whole file, which is a very odd thing to combine with forward
> references.
>
> If aliases auto-create labels we have the same issue more directly -
> aliases certainly *can* be changed by overlays, so does that alter the
> label definition as well.
>
>> (Syntax #5)
>> I think other options would have to include deprecating some or all of
>> the current syntax. This might include deprecating
>> =A0 =A0 =A0 &{/path/to/node}
>>
>> So that we can make '&label' always be just a label identifier and then
>> have something else to mean reference (maybe '%').
>
> So, '&' is *supposed* to mean reference, not "here is a label". =A0I
> chose than syntax based on the &variable syntax in C, figuring that
> "address of" is in reasonable analogy with "phandle of" or "path of"
> (because they're replacing an abstract handle on an object with a
> specific encoding of the object's location).
>
> Arguably, our new use of &label in tree overlays breaks this analogy.
> Dang. =A0Now that I think of it, that was probably the half-formed
> objection I had in mind before I forgot it again and acked Grant's
> adding of this extension.

+1 to pretty much everything you say in your reply here.  It is a good anal=
ysis.

With regard to the '&' usage, we could very easily change the use of
'&' at this point as it has only recently been merged (Sept 20) so it
is very unlikely that there are significant users.  What would a
better syntax be?

g.
