From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 23:02:44 +0200
Message-ID: <20130529210244.C70AD3831A5@gemini.denx.de>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <20130528210829.850203831A2@gemini.denx.de>
 <CAPnjgZ2a+qrsPWTz5Y=48m_LCRqAikY0-seJudW8AY5asdwmxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <CAPnjgZ2a+qrsPWTz5Y=48m_LCRqAikY0-seJudW8AY5asdwmxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Simon,

In message <CAPnjgZ2a+qrsPWTz5Y=48m_LCRqAikY0-seJudW8AY5asdwmxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> you wrote:
> 
> > I think this is not a good way to address this issue.  The GCC
> > documentation (section "System-specific Predefined Macros" [1])
> > desribes how this should be handled.  The "correct" (TM) way to fix
> > this is by adding "-ansi" or any "-std" option that requests strict
> > conformance to the compiler/preprocessor command line.
> >
> > [1] http://gcc.gnu.org/onlinedocs/cpp/System_002dspecific-Predefined-Macros.html#System_002dspecific-Predefined-Macros
> 
> Stephen suggested a slightly more extreme version too - I was worried
> that all the typing stuff in U-Boot headers would break in this case,
> but I didn't actually test it, so perhaps it is fine.

Yes, I've seen it.  I think either approach is better that manually
undef-ing specific variables.  From my personal point of view I think
the -undef approach is a bit of overkill, but I would not protest.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
panic: can't find /
