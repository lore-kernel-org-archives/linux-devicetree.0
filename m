From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 09:00:37 -0700
Message-ID: <CAPnjgZ2a+qrsPWTz5Y=48m_LCRqAikY0-seJudW8AY5asdwmxw@mail.gmail.com>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
	<20130528210829.850203831A2@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20130528210829.850203831A2@gemini.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Wolfgang Denk <wd@denx.de>
Cc: u-boot-review <u-boot-review@google.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Tom Rini <trini@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Wolfgang,

On Tue, May 28, 2013 at 2:08 PM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Simon Glass,
>
> In message <1369769778-12455-1-git-send-email-sjg@chromium.org> you wrote:
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

Stephen suggested a slightly more extreme version too - I was worried
that all the typing stuff in U-Boot headers would break in this case,
but I didn't actually test it, so perhaps it is fine.

Regards,
Simon
