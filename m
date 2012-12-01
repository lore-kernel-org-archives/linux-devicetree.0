From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] gpio: dt: add gpio-export support
Date: Sat, 1 Dec 2012 17:56:24 +0100
Message-ID: <CACRpkdbMNxFAYZBVai4=GjMioRhe6odhFrPsM3Tx_p6gBA357g@mail.gmail.com>
References: <20121121101259.GQ4398@game.jcrosoft.org>
 <CACRpkdZN12bsx_YgXFfOPZzebjNG6fbwF9y=vNhzzyye-jsQUg@mail.gmail.com>
 <20121124184846.GC4398@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121124184846.GC4398-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 24, 2012 at 7:48 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 15:43 Wed 21 Nov     , Linus Walleij wrote:
>> On Wed, Nov 21, 2012 at 11:12 AM, Jean-Christophe PLAGNIOL-VILLARD
>> <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
>>
>> > HI,
>> >
>> >         This patch serie add the support of gpio-export to DT
>> >
>> >         This also extend to gpio_export with the possibility to specify a name
>> >         for the gpio.
>> >         When you support different hardware you do not need to knwon which gpio
>> >         is used at application level just you have it
>> >
>> >         based on next-20121115 tested on AT91 Animeo IP
>> >
>> >   gpiolib-of: ad gpio-export support (2012-11-19 20:36:03 +0800)
>>
>> OK so this is definately Grant territory, I'm just a novice in DT land...
>> Grant can you look at this?
> Grant any comment?

Yeah, ping on Grant :-)

He did come back online last week but will need time to catch up.

Yours,
Linus Walleij
