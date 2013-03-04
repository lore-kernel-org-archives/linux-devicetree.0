From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: imx: use pin_func_ids to search the pinctrl
 item.
Date: Mon, 4 Mar 2013 10:18:53 +0800
Message-ID: <CAP1dx+xB0O2zouDcjmv3uO1Nk3EGytmAxn18tEO7EzXJOWoh8w@mail.gmail.com>
References: <1361932553-8218-1-git-send-email-b32955@freescale.com>
 <1361932553-8218-2-git-send-email-b32955@freescale.com>
 <CACRpkdYO5UN=t_nu1XQmBAjH6zWZRgnOY2zSQeO2K=ERrUPQCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYO5UN=t_nu1XQmBAjH6zWZRgnOY2zSQeO2K=ERrUPQCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 1 March 2013 21:07, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Feb 27, 2013 at 3:35 AM, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> The uart may works in DTE mode or DCE mode. The customer can sets the different
>> modes by the pinctrl. But the pinctrl items for DTE or DCE may share the
>> same Pad id, such as:
>>   MX6Q_PAD_EIM_D27__UART2_RXD_DTE and MX6Q_PAD_EIM_D27__WEIM_WEIM_D_27
>>   share the same MX6Q_PAD_EIM_D27 pad id.
>>
>> The current code only search the pinctrl items by pad id. So if there two
>> pinctrl items shares the same pad id, the current code only use the first one,
>> even you tell the system to use the second one in the DTS file.
>>
>> This patch adds a new field pin_func_ids to imx_pin_group{}, and uses the
>> pin_func_ids as the index to search the pinctrl items. In this way, we can
>> avoid the issue.
>>
>> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Dong/Shawn: what about this patch?
>

We do not need this patch anymore since we've changed the binding a bit.

Regards
Dong Aisheng

> The patches anyway has to be merged through the i.MX tree I think,
> if there is a huge movement in these files currently.
>
> Yours,
> Linus Walleij
