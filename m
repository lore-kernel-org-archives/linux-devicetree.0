From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Mon, 9 Jan 2012 23:26:38 +0000
Message-ID: <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316596786-2539-1-git-send-email-dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Content-ID: <9583510F753D9841A913C9092DAE49AF-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?iso-8859-2?Q?Pawe=B3_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 4:19 AM, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> =A0 =A0 =A0* edid -- It should be possible to have a fairly generic bindi=
ng
> =A0 =A0 =A0 =A0for EDID interfaces, but none seems to exist yet. =A0Discu=
ssion
> =A0 =A0 =A0 =A0is needed regarding what form this should take.
>
> =A0 =A0 =A0 =A0This might more appropriately be called "ddc" (or some
> =A0 =A0 =A0 =A0variation on that), since EDID seems only to describe the
> =A0 =A0 =A0 =A0format of the ID data retrievable via this interface; not =
the
> =A0 =A0 =A0 =A0interface itself.

Has there been any progress on this issue?  I'm looking to add EDID
support to a PowerPC device tree.  A TI developer is using
"ti,eeprom", but I'm not sure that's a good choice.

-- =

Timur Tabi
Linux kernel developer at Freescale
