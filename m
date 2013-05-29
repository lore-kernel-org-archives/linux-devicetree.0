From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 11:02:45 -0600
Message-ID: <51A634B5.5060309@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <20130528210829.850203831A2@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130528210829.850203831A2-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
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
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/28/2013 03:08 PM, Wolfgang Denk wrote:
> Dear Simon Glass,
> 
> In message <1369769778-12455-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> you wrote:
>>
>> Some device tree files use the word 'linux' which gets replaced with '1' by
>> many version of gcc, including version 4.7. So undefine this.
> 
> I think this is not a good way to address this issue.  The GCC
> documentation (section "System-specific Predefined Macros" [1])
> desribes how this should be handled.  The "correct" (TM) way to fix
> this is by adding "-ansi" or any "-std" option that requests strict
> conformance to the compiler/preprocessor command line.
> 
> [1] http://gcc.gnu.org/onlinedocs/cpp/System_002dspecific-Predefined-Macros.html#System_002dspecific-Predefined-Macros

-ansi at least was considered when the Linux kernel patches for dtc+cpp
support were being developed, but it was rejected. While it possibly
does solve this specific issue fine, there were other more general
problems; IIRC (and I might not) it completely changes the way macro
expansion happens, which results in it being pretty useless. Hence, "-x
assembler-with-cpp" was chosen over e.g. "-ansi".
