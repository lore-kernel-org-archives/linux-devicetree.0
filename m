From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Passing an initrd to a Linux kernel with Device Tree
Date: Wed, 21 Sep 2011 08:38:28 -0600
Message-ID: <CACxGe6tvHvR4sWUCFFJ+nP7ewH0pr-=bZqwR8o8AjjgnXhck+g@mail.gmail.com>
References: <4e78d3aa.21b0ec0a.63e9.1591SMTPIN_ADDED@mx.google.com>
	<20110920201058.GM7781@ponder.secretlab.ca>
	<3A52818B08EC2744B4FE79467451246180DF6E9E12@GEORGE.Emea.Arm.com>
	<alpine.LFD.2.00.1109210957050.12663@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109210957050.12663-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olivier Martin <Olivier.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 8:25 AM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> On Wed, 21 Sep 2011, Dave P Martin wrote:
>
>>
>>
>> > -----Original Message-----
>> > From:
>> > devicetree-discuss-bounces+dave.martin=3Darm.com-uLR06cmDAlY8sQ00jmICUQ@public.gmane.org
>> g [mailto:devicetree-discuss-> bounces+dave.martin=3Darm.com-uLR06cmDAlZ4lb6lR7t5LA@public.gmane.org=
s.org] On Behalf Of
>> > Grant Likely
>> > Sent: 20 September 2011 21:11
>> > To: Olivier Martin
>> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> > Subject: Re: Passing an initrd to a Linux kernel with Device Tree
>> >
>> > On Tue, Sep 20, 2011 at 06:46:22PM +0100, Olivier Martin wrote:
>> > > Hello,
>> > >
>> > > I tried recently to add support in UEFI to pass an initrd
>> > with FDT to
>> > > a Linux kernel. I have searched the Internet but I did not find any
>> > > information to do that.
>> > >
>> > > FYI, this is the way it is done in ATAG:
>> > > typedef struct {
>> > > =A0 UINT32 =A0start;
>> > > =A0 UINT32 =A0size;
>> > > } LINUX_ATAG_INITRD2;
>> > >
>> > > The boot loader loads the initrd in system memory and passes the
>> > > memory region information through ATAG.
>> > >
>> > >
>> > > Sorry, if it is the wrong mailing-list. In this case, can someone
>> > > point me on the right forum for any Linux FDT oriented questions.
>> >
>> > Hmmm, it may not be documented (the binding was implemented a
>> > long time ago before we got strict about documenting
>> > bindings). =A0The magic is two properties in the /chosen node;
>> > "linux,initrd-start" and "linux,initrd-end". =A0Each contains
>> > the physical start and end addresses of the initrd.
>>
>> What does "end address" mean here?
>>
>> It could be read as meaning either:
>>
>> a) address of the the final byte of the image
>> b) address of the first byte following the image (0 if the image ends at=
 4G)
>
> Looking at the code (remember this is always the ultimate
> documentation), end_address =3D start_address + size. =A0So (b) would be =
the
> right answer.

Yes, (b) is correct.  I lost 2 days of my life tracking down a bug
last year that turned out to be that I incorrectly assumed (a).

g.
