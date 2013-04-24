From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: Re: [PATCH 0/3] dts: v8500: Cleanups for 3.10
Date: Thu, 25 Apr 2013 10:39:28 +1200
Message-ID: <51785F20.704@prisktech.co.nz>
References: <1366781902-13025-1-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366781902-13025-1-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
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
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/04/13 17:38, Tony Prisk wrote:
> Arnd, Olof,
>
> This is probably a bit late for 3.10 now but its just a bunch of cleanups for
> the arch-vt8500 devicetree SoC and board files, and the addition of a new
> dts for the VIA APC8750.
>
> Regards
> Tony P
>
> Tony Prisk (3):
>    dts: vt8500: Fix invalid/missing cpu nodes for soc files.
>    dts: vt8500: Add devicetree support for WM8750 SoC and APC8750 board
>    dts: vt8500: Update serial nodes and disable by default in SoC files
>
>   arch/arm/boot/dts/Makefile           |    1 +
>   arch/arm/boot/dts/vt8500-bv07.dts    |    4 +
>   arch/arm/boot/dts/vt8500.dtsi        |   29 ++-
>   arch/arm/boot/dts/wm8505-ref.dts     |    4 +
>   arch/arm/boot/dts/wm8505.dtsi        |   35 +++-
>   arch/arm/boot/dts/wm8650-mid.dts     |    4 +
>   arch/arm/boot/dts/wm8650.dtsi        |   21 +-
>   arch/arm/boot/dts/wm8750-apc8750.dts |   30 +++
>   arch/arm/boot/dts/wm8750.dtsi        |  355 ++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/wm8850-w70v2.dts   |    4 +
>   arch/arm/boot/dts/wm8850.dtsi        |   23 ++-
>   11 files changed, 492 insertions(+), 18 deletions(-)
>   create mode 100644 arch/arm/boot/dts/wm8750-apc8750.dts
>   create mode 100644 arch/arm/boot/dts/wm8750.dtsi
>
Don't worry about this patch series - it looks like we are going back to 
926ejs (rather than changing to 926) so I will send out another request 
after the merge window.

Regards
Tony P
