From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Remove invalid macro starting with _ from libfdt_env.h
Date: Sat, 14 Apr 2012 09:29:02 -0500
Message-ID: <E1SJ3yI-0007Ut-Gw@jdl.com>
References: <89AE14E37D740B4796DC14566DF6325EF50AFFFAA9@SJEXCHCCR02.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <89AE14E37D740B4796DC14566DF6325EF50AFFFAA9-O8zWF298ijDMzT0UNPJNr71+IgudQmzARxWJa1zDYLQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Bert Kenward <bert.kenward-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> libfdt_env.h in the device tree compiler currently defines a _B() macro. This is in the
> namespace reserved for the implementation, and Cygwin's ctype.h actually defines a macro
> with this name. This renames _B to EXTRACT_BYTE.
> 
> Signed-off-by: Bert Kenward <bert.kenward-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Applied.

Thanks,
jdl
