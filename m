From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Of the device tree binary format endianness on little-endian
	platform
Date: Tue, 24 Feb 2009 15:26:15 -0600
Message-ID: <ed82fe3e0902241326g39a5c7fdj861aa37ebe821aee@mail.gmail.com>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1234975585.17001.131.camel-AlTa8cHOufjkPJRI6LV1/EZjUo8kaGiB@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2009 at 10:46 AM, Laurent Gregoire
<laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> We are currently investigating the use of a flattened device-tree for
> configuring some boot parameters on a new ARM platform.

Laurent,

I'm very interested in the work you are planning on doing.  How are
you planning on integrating device-tree support into the kernel?  That
is, are you going to be adding the code so that's local to your ARM
platforms, or are you looking to make the device tree API available
for all ARM?

-- 
Timur Tabi
Linux kernel developer at Freescale
