From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/9] irq: convert generic-chip to use irq_domain
Date: Wed, 14 Dec 2011 14:26:11 -0700
Message-ID: <CACxGe6uTp_=G4ODqzJdOTou2gzAM9LX8xHtKkeL8Safq0+B2rw@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
 <1323876538-20406-4-git-send-email-robherring2@gmail.com>
 <CACxGe6sqTx4h3vPgq+XrAoqLTiDMB-vcS5C9GgYssdsSYV_0qA@mail.gmail.com>
 <4EE913C7.1060901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EE913C7.1060901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 2:23 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
> On 12/14/2011 03:14 PM, Grant Likely wrote:
>> On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Add irq domain support to irq generic-chip. This enables users of
>>> generic-chip to support dynamic irq assignment needed for DT interrupt
>>> binding. Users must be converted to use irq_data.hwirq for determining
>>> local interrupt numbers rather than using the Linux irq number.
>>>
>>> irq_base is kept for now as there are a few users of it. Once they
>>> are converted to use the irq domain, it can be removed.
>>>
>>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>> ---
>>> =A0include/linux/irq.h =A0 =A0 =A0 | =A0 =A02 +-
>>> =A0kernel/irq/Kconfig =A0 =A0 =A0 =A0| =A0 =A01 +
>>> =A0kernel/irq/generic-chip.c | =A0 57 ++++++++++++++++++++++++++++-----=
-----------
>>> =A03 files changed, 38 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/include/linux/irq.h b/include/linux/irq.h
>>> index bff29c5..9ba8a30 100644
>>> --- a/include/linux/irq.h
>>> +++ b/include/linux/irq.h
>>> @@ -664,7 +664,7 @@ struct irq_chip_generic {
>>> =A0 =A0 =A0 =A0raw_spinlock_t =A0 =A0 =A0 =A0 =A0lock;
>>> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*reg_base;
>>> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq_base;
>>> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq_cnt;
>>> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 *domain;
>>
>> Instead of making domain a pointer, why not embed the structure inside
>> irq_chip_generic? =A0I don't see a reason for keeping it separate.
>>
>
> There is a circular header dependency between irq.h and irq_domain.h.
> Maybe I just need to put the include of irq_domain.h just above here
> rather than the top of the file.

Yes, try that.  I'd rather get the dependency problem sorted out.
Alternately, problematic bit of irq_domain.h can be moved to another
header.

g.
