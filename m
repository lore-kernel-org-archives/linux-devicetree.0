From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dtc: Basic integer expressions
Date: Tue, 17 Apr 2012 20:52:13 -0600
Message-ID: <4F8E2C5D.2010202@wwwdotorg.org>
References: <1333508160-7015-1-git-send-email-swarren@wwwdotorg.org>
 <E1SHEsg-0001Z3-6r@jdl.com> <20120410022922.GE29577@game.jcrosoft.org>
 <4F83AF3D.6040903@wwwdotorg.org> <E1SHcIC-0007yo-QY@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1SHcIC-0007yo-QY-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/10/2012 08:43 AM, Jon Loeliger wrote:
>>>
>>> can we update the kernel with it in next I'm goint to use it for at91 too
>>
>> Sure.
>>
>> Grant,
>>
>> Should I just port this individual patch, or pull in the whole of ToT
>> dtc? I vaguely recall you advocating the latter sometime recently.
> 
> We should wait and include the recently posted patch:
> 
>     From:    Andrej Krutak
>     Subject: Re: [PATCH] Rename _B to _XBYTE in libfdt_env.h.

Oh, I see this actually is there already in upstream dtc, although the
patch subject ended up being something different.

In general, do you recommend just copying upstream dtc over the top of
the kernel copy, or streaming in patches individually, or something
else? Is there someone who usually does this; I see a lot of different
committers to scripts/dtc in the kernel.
