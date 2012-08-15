From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 3/6] OF: pinctrl: MIPS: lantiq: adds support for FALCON SoC
Date: Wed, 15 Aug 2012 22:14:05 +0200
Message-ID: <502C030D.1030604@openwrt.org>
References: <1343112660-12245-1-git-send-email-blogic@openwrt.org>
 <1343112660-12245-3-git-send-email-blogic@openwrt.org>
 <CACRpkdYP8PdcnS2h_-+n9ZdBmMuBPUv9so9WsUyS-X5rMz1qsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYP8PdcnS2h_-+n9ZdBmMuBPUv9so9WsUyS-X5rMz1qsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Is it ok if i have these pinctrl patches go upstream via the MIPS tree ?
Grant seems to still be on vacation and i would like to see them enter 3.7

Thanks,
John

On 28/07/12 01:23, Linus Walleij wrote:
> On Tue, Jul 24, 2012 at 8:50 AM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>
>> Implement support for pinctrl on lantiq/falcon socs. The FALCON has 5 banks
>> of up to 32 pins.
>>
>> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> Signed-off-by: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> No big issues and looking really sweet so:
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>> --- a/arch/mips/lantiq/Kconfig
>> +++ b/arch/mips/lantiq/Kconfig
>> @@ -20,6 +20,7 @@ config SOC_XWAY
>>
>>  config SOC_FALCON
>>         bool "FALCON"
>> +       select PINCTRL_FALCON
> I think you need to add "select PINCTRL" above "select PINCTRL_FALCON"
> for this to work.
>
> Atleast I had to do that in the past to get things working.
>
> Yours,
> Linus Walleij
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>
