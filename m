From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add support for a fake, para-virtualised machine
Date: Tue, 18 Dec 2012 17:59:01 +0000
Message-ID: <201212181759.01676.arnd@arndb.de>
References: <1355853196-23676-1-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355853196-23676-1-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
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
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 December 2012, Will Deacon wrote:
> This is version three of the patches originally posted here:
> 
>   v1.) http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/135870.html
>   v2.) http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/137750.html
> 
> Thanks to all those who have provided comments so far.
> Changes for v3 include:
> 
>         * Ripped out *even more* SMP code by rebasing onto latest
>           mainline
>         * Removed function-base property from device-tree binding
>         * Annotated the low-level firmware invocation functions with
>           noinline to clarify intent
>         * Minor cleanups
> 
> As usual, testing this relies on KVM support for PSCI, a magic kvmtool
> and Mark Rutland's arch-timer patches.
> 

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
