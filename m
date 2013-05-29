From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 23:33:47 +0200
Message-ID: <20130529213347.821AE3831A5@gemini.denx.de>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <20130528210829.850203831A2@gemini.denx.de> <51A634B5.5060309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <51A634B5.5060309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Stephen,

In message <51A634B5.5060309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>
> > I think this is not a good way to address this issue.  The GCC
> > documentation (section "System-specific Predefined Macros" [1])
> > desribes how this should be handled.  The "correct" (TM) way to fix
> > this is by adding "-ansi" or any "-std" option that requests strict
> > conformance to the compiler/preprocessor command line.
> > 
> > [1] http://gcc.gnu.org/onlinedocs/cpp/System_002dspecific-Predefined-Macros.html#System_002dspecific-Predefined-Macros
> 
> -ansi at least was considered when the Linux kernel patches for dtc+cpp
> support were being developed, but it was rejected. While it possibly

Can you provide references?  I'd like to understand why it was
rejected - it seems to be the "official" approach to the problem.

> does solve this specific issue fine, there were other more general
> problems; IIRC (and I might not) it completely changes the way macro
> expansion happens, which results in it being pretty useless. Hence, "-x
> assembler-with-cpp" was chosen over e.g. "-ansi".

Again, do you have any reference?  "completely changes the way macro
expansion happens" sounds terribly dangerous, so it would be better to
know about that exactly...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
"You shouldn't make my toaster angry." - Household security explained
in "Johnny Quest"
