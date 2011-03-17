From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Thu, 17 Mar 2011 12:31:15 +0800
Message-ID: <20110317043114.GG11658@S2100-06.ap.freescale.net>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
	<20110312145532.GA10194@S2100-06.ap.freescale.net>
	<20110314211019.GH16096@angua.secretlab.ca>
	<20110316135800.GB11658@S2100-06.ap.freescale.net>
	<20110316230500.GB15557@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110316230500.GB15557-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2011 at 05:05:00PM -0600, Grant Likely wrote:
> 
[...]
> I'd like to have feedback on the new code to make sure that the model
> is sane.  There are some fiddly code it there which is used to match
> platform_device registrations to nodes in the device tree.  I *think*
> it makes sense, but I'd like to hear other opinions.
> 
Binding platform_device with of_node via resources matching seems a
little fiddly, but your implementation looks solid to me.  I made a
quick scan on all the platform_device registration under
arch/arm/plat-mxc/devices, nothing would be broken, only except
platform-gpio_keys which is not an on-chip device.

Looking at the code, I'm wondering how the binding of resource type
IORESOURCE_DMA looks like.  I'm seeing some platform_device is using
this flag to tell dma channel fixed for the device.  I'm not sure if
it can be fit in property 'dma-ranges'.  And I only see IORESOURCE_MEM
and IORESOURCE_IRQ being used in the matching model.

-- 
Regards,
Shawn
