From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: dynamic device tree char driver
Date: Tue, 21 Aug 2012 11:55:21 -0700
Message-ID: <71B37E0559AC6849A68C5BA94C509FB45A02736C8A@SJ-ITMSG02.altera.priv.altera.com>
References: <1345146226-32675-1-git-send-email-atull@altera.com>
 <502FB8A9.4030907@gmail.com> <1345559902.4616.157.camel@atc-linux-1>
 <5033BCAE.6080902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5033BCAE.6080902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-08-21 at 11:51 -0500, Rob Herring wrote:
> On 08/21/2012 09:38 AM, Alan Tull wrote:
> > On Sat, 2012-08-18 at 10:45 -0500, Rob Herring wrote:
> >> On 08/16/2012 02:43 PM, Alan Tull wrote:
> >>>
> >>> Hello,
> >>>
> >>> I'm Alan Tull, interested in dynamic features of device trees.
> >>
> >> Hey Alan. How are you doing?
> > Doing good! Nice to hear from you.
> >
> >>
> >>> The following patch adds a char driver to add or remove device tree
> >>> nodes dynamically.  Its ioctl passes a struct with:
> >>>  - size of the blob
> >>>  - pointer to the blob
> >>>
> >>> The path to add the nodes under is coded in the blob with dummy nodes.
> >>> For example the following can be compiled into a blob and sent to this
> >>> driver adding a single node under /soc/apb_periphs:
> >>>
> >>> /dts-v1/;
> >>> / {
> >>>         soc {
> >>>                 apb_periphs {
> >>>                         i2c1: i2c@ffc05000 {
> >>>                                 compatible = "snps,designware-i2c";
> >>>                                 reg = <0xffc05000 0x1000>;
> >>>                                 interrupts = <0 159 4>;
> >>>                                 emptyfifo_hold_master = <1>;
> >>>                         };
> >>>                 };
> >>>         };
> >>> };
> >>>
> >>> I wanted to get feeback early before I went too far down this particular
> >>> path.  As such, this code doesn't do any notification for drivers yet.
> >>> Also it won't properly add nested nodes yet.  It can add/remove a single
> >>> node and see it show up properly under /proc/device-tree.
> >>
> >> Have you looked at arch/powerpc/platforms/pseries/reconfig.c?
> > Yes.  In fact I borrowed a three functions from it and gave credit in
> > the patch.  I'm trying to do something that is architecture independent
> > and that uses the same type of device tree files (blobs) as are used
> > during bootup. In my case it will run on an ARM which will have soft
> > peripherals instantiated in a FPGA.  So after bootup we want to be able
> > to reconfigure the IP in the FPGA dynamically, then reconfigure the
> > device tree and load some drivers.  Pretty cool stuff.That's why I'm
> > interested in doing this dynamically without a reboot.
> >
> >
> >> There was also a recent discussion titled "OF_DYNAMIC usage" that you
> >> should look at.
> >>
> >> I don't think a char driver and ioctls will fly...
> > Doh!  Yes, I know the thread.  For some reason, I thought it would be
> > better to post a patch as a new thread rather than posting a patch to
> > the "OF_DYNAMIC usage" thread but perhaps not.  Sorry for forking the
> > discussion.
>
> The fork is fine. Just making sure you were aware of it.
>
> > That is where I got the idea of doing ioctls.  I am assuming that
> > there's only going to be one proper place in the tree for each blob to
> > get inserted, so I leave that path information in the blob rather than
> > storing it passing it as a separate parameter of the ioctl.
>
> ioctls simply won't fly. So I would start by extending the current
> interface to do blobs. From a user standpoint, something like this is
> certainly easier to use than an ioctl:
>
> echo "add blob" > /proc/devicetree/ofdt
> cat blob.dtb > /proc/devicetree/ofdt

That does have the advantage of not needing a userspace app.  But
something could write to /proc/devicetree/ofdt between the echo and the
cat.  A way to prevent that would be

echo "add blob" > add.txt
cat add.txt blob.dtb > /proc/devicetree/ofdt

In real world use, there would be a set of dtb's and a userspace app
that would prepend the "add blob" command when sending it to proc.

I am a bit surprised that it is considered fine to cat a binary file
to /proc.  I'm used to thinking that as all being readable text.

>
> > reconfig.c's interface is pretty bad.  It uses /proc as the place for
> > the user to write commands.  The commands are broken up such that the
> > userspace has to 'add _node', then do 'add_property' a few times.  Also
> > it had to introduce a flag "OF_DYNAMIC" (not to be confused with
> > "CONFIG_OF_DYNAMIC") to keep of_node_release from releasing the nodes
> > that are allocated in reconfig.c.  Seems messy.
> >
> > With an ioctl, the userspace can just send a single command to add a
> > blob.  The blob can contain one node or many nodes as long as they all
> > end up under the same path.  Removing nodes is just as straightforward
> > and clean.
>
> Whether paths are part of the blob are debatable. I'm sure you and your
> competitors can put your heads together and come up with something. :)
>
> Rob
>
> >>
> >> Another option could be kexecing with a new DTB if you can live with a
> >> reboot.
> > We are looking at reconfiguring soft peripheral in a FPGA on the fly.
> > So a reboot won't work here.
> >
> >>
> >> Rob
> >>
> >>>
> >>> Alan Tull
> >>> Altera
> >>>
> >>> _______________________________________________
> >>> devicetree-discuss mailing list
> >>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >>> https://lists.ozlabs.org/listinfo/devicetree-discuss
> >>>
> >>
> >>
> >
> >
> >
>
>


Confidentiality Notice.
This message may contain information that is confidential or otherwise protected from disclosure. If you are not the intended recipient, you are hereby notified that any use, disclosure, dissemination, distribution,  or copying  of this message, or any attachments, is strictly prohibited.  If you have received this message in error, please advise the sender by reply e-mail, and delete the message and any attachments.  Thank you.
