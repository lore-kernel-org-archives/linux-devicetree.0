From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 6/6] fdtput: Add basic tests
Date: Thu, 8 Sep 2011 05:55:51 -0700
Message-ID: <CAPnjgZ3kWnCJ++kwVdcpne5wjuvSw9eN2O9u4f74+8_f=+iQJg@mail.gmail.com>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-7-git-send-email-sjg@chromium.org>
	<20110908053235.GU30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908053235.GU30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, Sep 7, 2011 at 10:32 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 07, 2011 at 12:54:20PM -0700, Simon Glass wrote:
>> These tests verify the major features.
>
> Again, fold it into the previous patch. =A0No point having code and
> tests for the code separate.

OK will do. I generally split things up as much as I reasonably to
make it easy to deal with reviews, which can otherwise get out of
hand.

I will submit a new patch set once I have confirmation from you on
what you want done with:

- the -t format string
- the blob read function
- bringing ftdump into Makefile.utils

Regards,
Simon

>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
