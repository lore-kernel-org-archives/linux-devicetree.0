From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] Allow nodes at the root to be specified by path as
	well as by label.
Date: Mon, 18 Oct 2010 16:36:14 -0700
Message-ID: <AANLkTimT6WaCDgLM-cqEvrUqTmeDDohOGEgxDXjxssPQ@mail.gmail.com>
References: <20101018202353.24286.74857.stgit@riker>
	<20101018202540.24286.12690.stgit@riker>
	<20101018205034.GE2259@angua.secretlab.ca>
	<AANLkTimi_w-3pd9U6mKj5A78RzOp2KdBvh3fqgNTFBqH@mail.gmail.com>
	<20101018215143.GC3337@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8003640382926507287=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101018215143.GC3337-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============8003640382926507287==
Content-Type: multipart/alternative; boundary=90e6ba6e811459cf2b0492eca49b

--90e6ba6e811459cf2b0492eca49b
Content-Type: text/plain; charset=ISO-8859-1

It seems we have conflicting syntax for path references and label
references.

Here's what we have now:

&label
&{/path/to/the/node}

It's not a problem until we want to combine them. If we want a path rooted
at label suddenly there is the question of the curly braces. What should we
have?

&label{/path/to/the/subnode/}
&{label/path/to/the/subnode/}
&label/path/to/the/subnode


In looking at the dtc code, it appears that '&' is only used to reference
exising nodes. So I don't think the curly braces are necessary.

How about we do the following:

   1. deprecate &{/path/to/the/node/} - if it's not used anywhere, can just
   remove the code and not worry about deprecating it
   2. use the following to reference nodes:

&label   /* just refers to a labeled node */
&/path/to/the/node /* refers to a node by it's path */
&label/path/to/the/subnode /* refers to a node rooted at the label and
follows the path down */

Thoughts?

- John


On Mon, Oct 18, 2010 at 2:51 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>wrote:

> On Mon, Oct 18, 2010 at 02:08:33PM -0700, John Bonesio wrote:
> > On Mon, Oct 18, 2010 at 1:50 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> >wrote:
> >
> > > On Mon, Oct 18, 2010 at 01:25:50PM -0700, John Bonesio wrote:
> > > > Changes to allow us to specify a node by it's path. A path can be
> used in
> > > > place of a label.
> > > >
> > > > This is particularly useful when overriding existing nodes.
> > > > This way we don't have to label every possible node in a device tree
> we
> > > know
> > > > is a base device tree for a class of systems, and we know the tree
> will
> > > be
> > > > modified for the specific systems.
> > > >
> > > > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > > > ---
> > > >
> > > >  dtc-parser.y |   16 ++++++++++++----
> > > >  1 files changed, 12 insertions(+), 4 deletions(-)
> > >
> > > Need to add test cases.
> > >
> > > >
> > > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > > index 56d7789..0efd0cc 100644
> > > > --- a/dtc-parser.y
> > > > +++ b/dtc-parser.y
> > > > @@ -134,22 +134,30 @@ devicetree:
> > > >               {
> > > >                       struct node *target;
> > > >
> > > > -                     target = get_node_by_label($1, $2);
> > > > +                     if ($2[0] == '/')
> > > > +                             target = get_node_by_path($1, $2);
> > > > +                     else
> > > > +                             target = get_node_by_label($1, $2);
> > > > +
> > > >                       if (target)
> > > >                               merge_nodes(target, $3);
> > > >                       else
> > > > -                             print_error("label, '%s' not found",
> $2);
> > > > +                             print_error("label or path, '%s', not
> > > found", $2);
> > > >                       $$ = $1;
> > > >               }
> > > >       | devicetree DT_REMOVENODE DT_REF ';'
> > > >               {
> > > >                       struct node *target;
> > > >
> > > > -                     target = get_node_by_label($1, $3);
> > > > +                     if ($3[0] == '/')
> > > > +                             target = get_node_by_path($1, $3);
> > > > +                     else
> > > > +                             target = get_node_by_label($1, $3);
> > > > +
> > > >                       if (target)
> > > >                               remove_nodes(target);
> > > >                       else
> > > > -                             print_error("label, '%s' not found",
> $3);
> > > > +                             print_error("label or path, '%s', not
> > > found", $3);
> > >
> > > Hmmm, this is effectively the same code block implemented twice.  Its
> > > gotten complex enough with this patch that the common parts should be
> > > factored out inot a common function...  In fact, after looking at the
> > > code, it looks like it should be calling get_node_by_ref() here.
> > >
> > > Also, this patch doesn't have any way to use the form
> > > &<label>/path/based/on/label which is also a critical feature.
> > >
> > >
> > Ok, so now I'm glad I separated this patch out.
> >
> > You're right in that it should be call get_node_by_ref(). I missed that.
> >
> > As for the rest of it, allow me to explain ...
> >
> > The lexer already parses &{/ <node path>} as a single lexical unit. When
> it
> > does this, it returns the token DT_REF, which is the same as for a label.
> > All I had to do is call the right routine to go find the right node.
>
> Right, I understand this.
>
> But I don't currently see how the code can handle the use case of a
> subnode from a label.  ie:
>
>        /{
>                my-label: parent {
>                        my-node {
>                        };
>                };
>        };
>
>        &my-label/my-node {
>                hi-there;
>        };
>
> The current code seems to be able to handle a full path, or a single
> label, but not a child node of a labelled node.
>
>
> >
> > I've run this through a sample dts file, and it does indeed work.
>
> (BTW, I think I gave you bad information earlier about syntax.  We
> have a syntax for full path, but we're missing a syntax for
> label+subpath), which you'll have to define.
>
> g.
>
>

--90e6ba6e811459cf2b0492eca49b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It seems we have conflicting syntax for path references and label reference=
s.<div><br></div><div>Here&#39;s what we have now:</div><div><br></div><div=
>&amp;label</div><div>&amp;{/path/to/the/node}</div><div><br></div><div>
It&#39;s not a problem until we want to combine them. If we want a path roo=
ted at label suddenly there is the question of the curly braces. What shoul=
d we have?</div><blockquote class=3D"webkit-indent-blockquote" style=3D"mar=
gin: 0 0 0 40px; border: none; padding: 0px;">
<div>&amp;label{/path/to/the/subnode/}</div><div>&amp;{label/path/to/the/su=
bnode/}</div><div>&amp;label/path/to/the/subnode</div></blockquote><div><br=
></div><div>In looking at the dtc code, it appears that &#39;&amp;&#39; is =
only used to reference exising nodes. So I don&#39;t think the curly braces=
 are necessary.</div>
<div><br></div><div>How about we do the following:</div><div><ol><li>deprec=
ate &amp;{/path/to/the/node/} - if it&#39;s not used anywhere, can just rem=
ove the code and not worry about deprecating it</li><li>use the following t=
o reference nodes:</li>
</ol></div><blockquote class=3D"webkit-indent-blockquote" style=3D"margin: =
0 0 0 40px; border: none; padding: 0px;"><div>&amp;label =A0 /* just refers=
 to a labeled node */</div><div>&amp;/path/to/the/node /* refers to a node =
by it&#39;s path */</div>
<div>&amp;label/path/to/the/subnode /* refers to a node rooted at the label=
 and follows the path down */</div><div><br></div></blockquote>Thoughts?<di=
v><br></div><div>- John<br><div><br></div><div><div><div><br><div class=3D"=
gmail_quote">
On Mon, Oct 18, 2010 at 2:51 PM, Grant Likely <span dir=3D"ltr">&lt;<a href=
=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex;">
On Mon, Oct 18, 2010 at 02:08:33PM -0700, John Bonesio wrote:<br>
&gt; On Mon, Oct 18, 2010 at 1:50 PM, Grant Likely &lt;<a href=3D"mailto:gr=
ant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;wrote:<br>
<div><div></div><div class=3D"h5">&gt;<br>
&gt; &gt; On Mon, Oct 18, 2010 at 01:25:50PM -0700, John Bonesio wrote:<br>
&gt; &gt; &gt; Changes to allow us to specify a node by it&#39;s path. A pa=
th can be used in<br>
&gt; &gt; &gt; place of a label.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is particularly useful when overriding existing nodes.<=
br>
&gt; &gt; &gt; This way we don&#39;t have to label every possible node in a=
 device tree we<br>
&gt; &gt; know<br>
&gt; &gt; &gt; is a base device tree for a class of systems, and we know th=
e tree will<br>
&gt; &gt; be<br>
&gt; &gt; &gt; modified for the specific systems.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: John Bonesio &lt;<a href=3D"mailto:bones@secr=
etlab.ca">bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0dtc-parser.y | =A0 16 ++++++++++++----<br>
&gt; &gt; &gt; =A01 files changed, 12 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; Need to add test cases.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/dtc-parser.y b/dtc-parser.y<br>
&gt; &gt; &gt; index 56d7789..0efd0cc 100644<br>
&gt; &gt; &gt; --- a/dtc-parser.y<br>
&gt; &gt; &gt; +++ b/dtc-parser.y<br>
&gt; &gt; &gt; @@ -134,22 +134,30 @@ devicetree:<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 {<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *tar=
get;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_nod=
e_by_label($1, $2);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ($2[0] =3D=3D &=
#39;/&#39;)<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ta=
rget =3D get_node_by_path($1, $2);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ta=
rget =3D get_node_by_label($1, $2);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
merge_nodes(target, $3);<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
&gt; &gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
int_error(&quot;label, &#39;%s&#39; not found&quot;, $2);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
int_error(&quot;label or path, &#39;%s&#39;, not<br>
&gt; &gt; found&quot;, $2);<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D $1;<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; &gt; &gt; =A0 =A0 =A0 | devicetree DT_REMOVENODE DT_REF &#39;;&#39;<br=
>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 {<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct node *tar=
get;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 target =3D get_nod=
e_by_label($1, $3);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ($3[0] =3D=3D &=
#39;/&#39;)<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ta=
rget =3D get_node_by_path($1, $3);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ta=
rget =3D get_node_by_label($1, $3);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (target)<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
remove_nodes(target);<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else<br>
&gt; &gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
int_error(&quot;label, &#39;%s&#39; not found&quot;, $3);<br>
&gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
int_error(&quot;label or path, &#39;%s&#39;, not<br>
&gt; &gt; found&quot;, $3);<br>
&gt; &gt;<br>
&gt; &gt; Hmmm, this is effectively the same code block implemented twice. =
=A0Its<br>
&gt; &gt; gotten complex enough with this patch that the common parts shoul=
d be<br>
&gt; &gt; factored out inot a common function... =A0In fact, after looking =
at the<br>
&gt; &gt; code, it looks like it should be calling get_node_by_ref() here.<=
br>
&gt; &gt;<br>
&gt; &gt; Also, this patch doesn&#39;t have any way to use the form<br>
&gt; &gt; &amp;&lt;label&gt;/path/based/on/label which is also a critical f=
eature.<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div></div>&gt; Ok, so now I&#39;m glad I separated this patch out.<br>
&gt;<br>
&gt; You&#39;re right in that it should be call get_node_by_ref(). I missed=
 that.<br>
&gt;<br>
&gt; As for the rest of it, allow me to explain ...<br>
&gt;<br>
&gt; The lexer already parses &amp;{/ &lt;node path&gt;} as a single lexica=
l unit. When it<br>
&gt; does this, it returns the token DT_REF, which is the same as for a lab=
el.<br>
&gt; All I had to do is call the right routine to go find the right node.<b=
r>
<br>
Right, I understand this.<br>
<br>
But I don&#39;t currently see how the code can handle the use case of a<br>
subnode from a label. =A0ie:<br>
<br>
 =A0 =A0 =A0 =A0/{<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0my-label: parent {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0my-node {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};<br>
 =A0 =A0 =A0 =A0};<br>
<br>
 =A0 =A0 =A0 =A0&amp;my-label/my-node {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hi-there;<br>
 =A0 =A0 =A0 =A0};<br>
<br>
The current code seems to be able to handle a full path, or a single<br>
label, but not a child node of a labelled node.<br>
<br>
<br>
&gt;<br>
&gt; I&#39;ve run this through a sample dts file, and it does indeed work.<=
br>
<br>
(BTW, I think I gave you bad information earlier about syntax. =A0We<br>
have a syntax for full path, but we&#39;re missing a syntax for<br>
label+subpath), which you&#39;ll have to define.<br>
<font color=3D"#888888"><br>
g.<br>
<br>
</font></blockquote></div><br></div></div></div></div>

--90e6ba6e811459cf2b0492eca49b--

--===============8003640382926507287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8003640382926507287==--
