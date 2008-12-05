From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: usb/eth DTS nodes for custom board based on mpc5200
Date: Fri, 5 Dec 2008 07:40:09 -0700
Message-ID: <fa686aa40812050640m4b4afe2egef638ca950cff041@mail.gmail.com>
References: <504269.31435.qm@web23108.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <504269.31435.qm-oikRafiNRKjyX4RqAA4FmIglqE1Y4D90QQ4Iyu8u01E@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: s104259-whZMOeQn8C0@public.gmane.org
Cc: linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2008 at 4:22 AM, Angelo <s104259-whZMOeQn8C0@public.gmane.org> wrote:
> Hi all.
>
> I'd like to know if it's necessary to modify my DTS.
>
> On my board I have:
> * u-boot 1.2.0
> * kernel 2.6.21
> * arch=powerpc
> * dts based on lite5200b.dts
> * USB port (USB2) configured on the Ethernet port
>
> Is it necessary to combine Ethernet and usb nodes into the device tree
> source?

No.  Configuring the Ethernet pins for USB IO is just a pin routing
board setup task.  You do need to make sure U-Boot sets up the
port_config register correctly, but it doesn't impact the device tree.
 You don't need to change any of the values in the USB node.

However, if the Ethernet device is unused then you should remove the
Ethernet node from your device tree.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
