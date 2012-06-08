From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: Overriding/concatenating kernel command-line with bootargs from
 dtb?
Date: Fri, 08 Jun 2012 17:49:20 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1206081630170.23555@xanadu.home>
References: <2050174.dvvKJHKP0J@flexo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <2050174.dvvKJHKP0J@flexo>
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
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 8 Jun 2012, Florian Fainelli wrote:

> Hi all,
> 
> I have a specific use case, where two boards using the same SoC have different 
> UART speeds, which is something that I have specified in their corresponding 
> dts files. In order to make sure people don't mess up the configuration, I 
> prefer not to rely on the bootloader-supplied kernel-command line.
> 
> I was kind of expecting that ARM_ATAG_DTB_COMPAT + CMDLINE_EXTEND would 
> actually concatenate the kernel command-line with the bootargs provided from 
> dtb.
> 
> Is this something someone else would need? If so, shall we just make that 
> happen when the two config symbols mentionned above are enabled, or shall we 
> introduce a 4th kernel command line handling strategy?

The former please.  The logic in parse_tag_cmdline() needs to be 
duplicated in early_init_dt_scan_chosen().  CONFIG_CMDLINE_FORCE is 
already implemented, so only CONFIG_CMDLINE_EXTEND is missing.


Nicolas
