From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/6] gpio: davinci: Fixed a check for unbanked gpio
Date: Wed, 6 Nov 2013 16:19:43 +0530
Message-ID: <527A1EC7.20400@ti.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
	<1383406775-14902-2-git-send-email-prabhakar.csenng@gmail.com>
	<CACRpkdZ7pwGQnK0NN4tybLUNdMxu5WVaGX8Dqu+kMgVBuyF16w@mail.gmail.com>
	<CA+V-a8tE3bxsHMSh2i3Xeq=kJUjmxTjcU25Kuka5e_iXeB--pQ@mail.gmail.com>
	<CACRpkdbLTopHMaog7FDW7O4-yLyv+mmnvgkNuXgeQR-pEtbz6Q@mail.gmail.com>
	<CA+V-a8tZTm9bh+arQ+uFyTVHxfdf07bWaM_Sdqo08TO=UCMMUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CA+V-a8tZTm9bh+arQ+uFyTVHxfdf07bWaM_Sdqo08TO=UCMMUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 November 2013 03:45 PM, Prabhakar Lad wrote:
> Hi Linus,
> 
> On Wed, Nov 6, 2013 at 3:26 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Nov 6, 2013 at 10:33 AM, Prabhakar Lad
>> <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Tue, Nov 5, 2013 at 6:09 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> On Sat, Nov 2, 2013 at 4:39 PM, Lad, Prabhakar
>>>> <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>
>>>>> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>
>>>>> This patch fixes the check for the offset in
>>>>> gpio_to_irq_unbanked() function.
>>>>>
>>>>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Is this a regression that should go in right now?
>>>>
>>> Yes it needs too.
>>
>> But on top of *what* exactly?
>>
>> This does not apply to my gpio tree devel branch and
>> not even on the mainline kernel.
>>
> Looks like this needs to go via ARM tree as the earlier
> patches have  gone via ARM tree itself [1].
> If you can ACK it Sekhar can get it in via ARM tree.

The dependent patches are all in linux-next through ARM SoC queued for
v3.13 merge. This fix can either be sent late in merge cycle once Linus
has pulled ARM SoC or after v3.13-rc1 comes out.

Thanks,
Sekhar
