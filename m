From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/9] Add dtget utility to read property values from device
	tree
Date: Sat, 3 Sep 2011 20:18:08 -0700
Message-ID: <CAPnjgZ3hB_nfGqVA_4+wQfxuanUn7nhVQMboEFSODK0UvsNqmg@mail.gmail.com>
References: <1309892577-23828-1-git-send-email-sjg@chromium.org>
	<1309892577-23828-3-git-send-email-sjg@chromium.org>
	<20110719033437.GB6399@yookeroo.fritz.box>
	<CAPnjgZ3GgOx-Sja2Lq2WzYy+FYv3oyUF9vzdZ8RPYE-Hsmjf0Q@mail.gmail.com>
	<CAPnjgZ1mSifP1rSSCZgDCDQvd-PR3Q++Qr_TovJVPW_BrH3fgA@mail.gmail.com>
	<20110903143355.GB12965@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110903143355.GB12965-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Sat, Sep 3, 2011 at 7:33 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Sep 02, 2011 at 10:54:28AM -0700, Simon Glass wrote:
>> Hi David,
>>
>> On Thu, Jul 28, 2011 at 5:22 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Hi David,
>> >
>> > On Tue, Jul 19, 2011 at 3:34 PM, David Gibson
>> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> >> On Tue, Jul 05, 2011 at 12:02:50PM -0700, Simon Glass wrote:
>> >>> This simply utility makes it easy for scripts to read values from th=
e device
>> >>> tree.
>> [snip]
>>
>> >>> +static int show_data_for_key(const void *blob, const char *format, =
int type,
>> >>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *key)
>> >>> +{
>> >>> + =A0 =A0 char *ptr, *prop;
>> >>> + =A0 =A0 int node, guess_node =3D 0;
>> >>> + =A0 =A0 const void *value;
>> >>> + =A0 =A0 int len;
>> >>> +
>> >>> + =A0 =A0 /* First extract the property from the end */
>> >>> + =A0 =A0 ptr =3D strrchr(key, '/');
>> >>> + =A0 =A0 if (!ptr) {
>> >>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "No node found in key '%s'=
\n", key);
>> >>> + =A0 =A0 =A0 =A0 =A0 =A0 return 5;
>> >>> + =A0 =A0 }
>> >>
>> >> This is wrong. =A0properties do not have paths - they exist in a
>> >> separate namespace to nodes. =A0The node path and property name should
>> >> be supplied as separate parameters. =A0As well as being actually righ=
t,
>> >> it will greatly simplify this function's convoluted logic.
>> >
>> > Well yes, but I feel that it makes it harder to use also. My thinking
>> > with this was to try to make it easy to extract information. In my
>> > view:
>> >
>> > /lcd/width
>> >
>> > is better than
>> >
>> > /lcd width
>> >
>> > But this is the kind of discussion / feedback I was hoping to get as I
>> > am new to device trees. My thoughts:
>> >
>> > 1. / is not generally used in property names so there is no conflict
>> > 2. Neither is there any ambiguity
>
> Yes there is. =A0Real device trees exist where a node has both a
> property and a subnode with the same name.

Er, ok. How about something like:

/path/to/node/.property

as a compromise? It removes the ambiguity I think, and still lets me
avoid having 3 parameters in fdtput per assignment.

Otherwise if you have any other suggestions I would appreciate it.

Regards,
Simon

>
>> > 3. The 'complex' logic is there to make life easy for the poor
>> > hard-pressed user.
>> > 4. Creating the concept of a sort-of unified name space for a device
>> > tree property is probably not a bad idea.
>>
>> I didn't hear back on this so I going to assume this is reasonable,
>
> No, I'm just busy.
>
>> and submit another patch set with your other comments addressed. The
>> intent of the fdt seems clearly hierarchical to me. Hope this is ok.
>
> No, treating node+property as a single path remains cause for an
> instant nack.
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
