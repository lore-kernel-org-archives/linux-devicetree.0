From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: at91: add at91sam9_wdt driver to at91sam926x,
 at91sam9g45
Date: Thu, 27 Sep 2012 17:00:01 +0200
Message-ID: <CAHkwnC-76qUZaKHA7O5rdMDCAbDB52b9UL9hKWWiTBFQHpUS0g@mail.gmail.com>
References: <1348568704-28304-1-git-send-email-fabio.porcedda@gmail.com>
 <1348568704-28304-3-git-send-email-fabio.porcedda@gmail.com>
 <20120927055021.GO17667@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120927055021.GO17667-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2012 at 7:50 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 12:25 Tue 25 Sep     , Fabio Porcedda wrote:
>> Enable the driver for the evk-pro3 board.
>>
>> Tested on an at91sam9260 board (evk-pro3).
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/at91sam9260.dtsi | 6 ++++++
>>  arch/arm/boot/dts/at91sam9263.dtsi | 6 ++++++
>>  arch/arm/boot/dts/at91sam9g45.dtsi | 6 ++++++
>>  arch/arm/boot/dts/evk-pro3.dts     | 4 ++++
> split board and soc

Ok, i will send an updated patch.

> Best Regards,
> J.

Best regards
-- 
Fabio Porcedda
