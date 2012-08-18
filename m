From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dynamic device tree char driver
Date: Sat, 18 Aug 2012 10:45:45 -0500
Message-ID: <502FB8A9.4030907@gmail.com>
References: <1345146226-32675-1-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345146226-32675-1-git-send-email-atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
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
To: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/16/2012 02:43 PM, Alan Tull wrote:
> 
> Hello,
> 
> I'm Alan Tull, interested in dynamic features of device trees.

Hey Alan. How are you doing?

> The following patch adds a char driver to add or remove device tree
> nodes dynamically.  Its ioctl passes a struct with:
>  - size of the blob
>  - pointer to the blob
> 
> The path to add the nodes under is coded in the blob with dummy nodes.
> For example the following can be compiled into a blob and sent to this
> driver adding a single node under /soc/apb_periphs:
> 
> /dts-v1/;
> / {
>         soc {
>                 apb_periphs {
>                         i2c1: i2c@ffc05000 {
>                                 compatible = "snps,designware-i2c";
>                                 reg = <0xffc05000 0x1000>;
>                                 interrupts = <0 159 4>;
>                                 emptyfifo_hold_master = <1>;
>                         };
>                 };
>         };
> };
> 
> I wanted to get feeback early before I went too far down this particular
> path.  As such, this code doesn't do any notification for drivers yet.
> Also it won't properly add nested nodes yet.  It can add/remove a single
> node and see it show up properly under /proc/device-tree.

Have you looked at arch/powerpc/platforms/pseries/reconfig.c?

There was also a recent discussion titled "OF_DYNAMIC usage" that you
should look at.

I don't think a char driver and ioctls will fly...

Another option could be kexecing with a new DTB if you can live with a
reboot.

Rob

> 
> Alan Tull
> Altera
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
