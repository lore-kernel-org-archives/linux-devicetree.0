From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: dynamic device tree char driver
Date: Tue, 21 Aug 2012 09:38:22 -0500
Message-ID: <1345559902.4616.157.camel@atc-linux-1>
References: <1345146226-32675-1-git-send-email-atull@altera.com>
 <502FB8A9.4030907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502FB8A9.4030907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2012-08-18 at 10:45 -0500, Rob Herring wrote:
> On 08/16/2012 02:43 PM, Alan Tull wrote:
> > 
> > Hello,
> > 
> > I'm Alan Tull, interested in dynamic features of device trees.
> 
> Hey Alan. How are you doing?
Doing good! Nice to hear from you.

> 
> > The following patch adds a char driver to add or remove device tree
> > nodes dynamically.  Its ioctl passes a struct with:
> >  - size of the blob
> >  - pointer to the blob
> > 
> > The path to add the nodes under is coded in the blob with dummy nodes.
> > For example the following can be compiled into a blob and sent to this
> > driver adding a single node under /soc/apb_periphs:
> > 
> > /dts-v1/;
> > / {
> >         soc {
> >                 apb_periphs {
> >                         i2c1: i2c@ffc05000 {
> >                                 compatible = "snps,designware-i2c";
> >                                 reg = <0xffc05000 0x1000>;
> >                                 interrupts = <0 159 4>;
> >                                 emptyfifo_hold_master = <1>;
> >                         };
> >                 };
> >         };
> > };
> > 
> > I wanted to get feeback early before I went too far down this particular
> > path.  As such, this code doesn't do any notification for drivers yet.
> > Also it won't properly add nested nodes yet.  It can add/remove a single
> > node and see it show up properly under /proc/device-tree.
> 
> Have you looked at arch/powerpc/platforms/pseries/reconfig.c?
Yes.  In fact I borrowed a three functions from it and gave credit in
the patch.  I'm trying to do something that is architecture independent
and that uses the same type of device tree files (blobs) as are used
during bootup. In my case it will run on an ARM which will have soft
peripherals instantiated in a FPGA.  So after bootup we want to be able
to reconfigure the IP in the FPGA dynamically, then reconfigure the
device tree and load some drivers.  Pretty cool stuff.That's why I'm
interested in doing this dynamically without a reboot.


> There was also a recent discussion titled "OF_DYNAMIC usage" that you
> should look at.
> 
> I don't think a char driver and ioctls will fly...
Doh!  Yes, I know the thread.  For some reason, I thought it would be
better to post a patch as a new thread rather than posting a patch to
the "OF_DYNAMIC usage" thread but perhaps not.  Sorry for forking the
discussion.

That is where I got the idea of doing ioctls.  I am assuming that
there's only going to be one proper place in the tree for each blob to
get inserted, so I leave that path information in the blob rather than
storing it passing it as a separate parameter of the ioctl.

reconfig.c's interface is pretty bad.  It uses /proc as the place for
the user to write commands.  The commands are broken up such that the
userspace has to 'add _node', then do 'add_property' a few times.  Also
it had to introduce a flag "OF_DYNAMIC" (not to be confused with
"CONFIG_OF_DYNAMIC") to keep of_node_release from releasing the nodes
that are allocated in reconfig.c.  Seems messy.

With an ioctl, the userspace can just send a single command to add a
blob.  The blob can contain one node or many nodes as long as they all
end up under the same path.  Removing nodes is just as straightforward
and clean.

> 
> Another option could be kexecing with a new DTB if you can live with a
> reboot.
We are looking at reconfiguring soft peripheral in a FPGA on the fly.
So a reboot won't work here.

> 
> Rob
> 
> > 
> > Alan Tull
> > Altera
> > 
> > _______________________________________________
> > devicetree-discuss mailing list
> > devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > https://lists.ozlabs.org/listinfo/devicetree-discuss
> > 
> 
> 
