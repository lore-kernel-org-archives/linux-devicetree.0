From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Tue, 10 Jan 2012 11:04:33 +0000
Message-ID: <20120110110433.GA2336@linaro.org>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
 <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Pawe? Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2012 at 11:26:38PM +0000, Tabi Timur-B04825 wrote:
> On Wed, Sep 21, 2011 at 4:19 AM, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> > ? ? ?* edid -- It should be possible to have a fairly generic binding
> > ? ? ? ?for EDID interfaces, but none seems to exist yet. ?Discussion
> > ? ? ? ?is needed regarding what form this should take.
> >
> > ? ? ? ?This might more appropriately be called "ddc" (or some
> > ? ? ? ?variation on that), since EDID seems only to describe the
> > ? ? ? ?format of the ID data retrievable via this interface; not the
> > ? ? ? ?interface itself.
> 
> Has there been any progress on this issue?  I'm looking to add EDID
> support to a PowerPC device tree.  A TI developer is using
> "ti,eeprom", but I'm not sure that's a good choice.

It turns out that because of the way things are wired up on vexpress, the
EDID is not really usable; so I wasn't planning to do anything about it.


I don't really know enough about this field to comment on whether it's
genuinely useful to have a specific binding for EDID.  If it's enough
to reference the appropriate I2C bus node from the display device node,
then I guess we don't necessarily need to worry about having a separate
binding.

If it makes no sense to attempt make EDID access fully generic, that
would sound like the right approach.

Cheers
---Dave
