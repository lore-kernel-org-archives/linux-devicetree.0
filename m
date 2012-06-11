From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Overriding/concatenating kernel command-line with bootargs from
 dtb?
Date: Mon, 11 Jun 2012 09:34:33 -0500
Message-ID: <4FD601F9.8020201@gmail.com>
References: <2050174.dvvKJHKP0J@flexo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2050174.dvvKJHKP0J@flexo>
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

On 06/08/2012 02:55 AM, Florian Fainelli wrote:
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
> 
> Thank you for your answers.

There was a patch to do this:

http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg10448.html

Please comment if this works for you.

Rob
