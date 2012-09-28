From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] Fix segfault in DTC
Date: Fri, 28 Sep 2012 13:05:33 -0600
Message-ID: <5065F4FD.4010807@wwwdotorg.org>
References: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-2-git-send-email-mmayer@broadcom.com>
 <20120925233054.GL9800@truffula.fritz.box> <50624393.30607@broadcom.com>
 <20120926003508.GB31993@truffula.fritz.box> <50632F78.4030709@broadcom.com>
 <5065D9C7.40906@wwwdotorg.org> <E1THfgr-0006Fg-KT@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1THfgr-0006Fg-KT-CYoMK+44s/E@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/28/2012 12:53 PM, Jon Loeliger wrote:
>>>
>>> Yeah, seems like the kernel DTC is quite old.
>>
>> FYI, I'm working on a patch to the kernel to bring in the latest dtc.
> 
> Awesome.  Thank you.
> 
>> I've run a regression test vs. the old dtc in the kernel ...
> 
> Which is the icky step.  Again, thank you.
> 
>> ... and found that
>> some of the PowerPC .dts files don't compile with the new dtc (but did
>> with the old), all due to non-existent labels/paths being referenced.
>> I'll try and track down whether this is a regression in dtc, or simply
>> buggy .dts files that weren't noticed before.
> 
> I think you should just smack the PowerPC guys. :-)

For the record in this thread, it was a regression I introduced into dtc
- the patch I just sent was for this.

>> Everything non-PowerPC works fine, and most PowerPC files work fine.
>> Where compilation succeeds, the md5sum of the .dtb is identical in every
>> case.

... and with that patch, every .dts in the kernel compiles to the same
md5sum before/after.
