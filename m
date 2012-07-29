From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [DTC] Compilation issue on Red-hat host systems
Date: Sun, 29 Jul 2012 07:15:41 -0500
Message-ID: <E1SvSPO-0008UF-0L@jdl.com>
References: <CALdT2jzsyC9TuXRgZxRP-zJjyfihUN_u2uXF=bSER3ARpPot3Q@mail.gmail.com>
 <20120719032633.GC8100@truffala.fritz.box>
 <CALdT2jw_m=uR8T=uE8BiptLG40_6K=5FsRWs4maR0u=4vUEyCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <CALdT2jw_m=uR8T=uE8BiptLG40_6K=5FsRWs4maR0u=4vUEyCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: jagan <402jagan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> 
> My flex version on system is flex version 2.5.4
> I tried by  -Wstrict-prototypes  form Makefile, But still I got the same
> error.
> 
> Do I need to upgrade my flex.
> 
> Regards,
> Jagan.

My flex is:

    $ flex --version
    flex 2.5.35

    $ gcc --version
    gcc (Debian 4.4.5-8) 4.4.5

and it works fine.

So, yes, upgrade your flex.

jdl
