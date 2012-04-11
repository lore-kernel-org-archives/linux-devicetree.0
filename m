From: "Jamie Lentin" <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Wed, 11 Apr 2012 14:32:34 +0100
Message-ID: <op.wclrwkqi4cuzmg@gonzo.lentin.co.uk>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-2-git-send-email-jm@lentin.co.uk>
 <20120406234955.840F73E1323@localhost>
 <alpine.DEB.2.00.1204091418400.23719@marmot.wormnet.eu>
 <20120411004324.GB14790@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120411004324.GB14790-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Apr 2012 01:43:24 +0100, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>  
wrote:

>> In a future land where everything has been converted to devicetree, what
>> would be best? An option to "Build all kirkwood-based .dtb's", an option
>> to build all D-link .dtb's, Q-QNAP .dtb's, etc. or an option for each
>> board? I've not got any strong opinion, so will reformat the above to
>> whatever is considered best.
>
> Based on Grant's comment, I'll probably be working towards a
> MACH_GLOBALSCALE_DT option to catch dreamplug,sheevaplug,guruplug, etc.
> Perhaps this should be MACH_BUFFALO_DT?
>

Thinking about it, MACH_DNSKW_DT would probably be best. Anything more  
general, e.g. MACH_DLINK_DNS_DT, would also cover the orion-based  
DNS-313/323/343. Presumably there will always be differences between  
kirkwood and orion5x?

Did you mean D-Link, or is there some relationship between Buffalo and  
D-link I'm not aware of? I know Conceptronic sold a ~identical device to  
the DNS-323, but not aware of anything else. You never know who truly  
makes the devices nowadays anyway.

-- 
Jamie Lentin
