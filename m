From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Tue, 14 Jun 2011 16:06:32 -0600
Message-ID: <BANLkTim5C340ZB4Hu1xFQpHAkcWJEgKjMw@mail.gmail.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<201106142232.02217.arnd@arndb.de>
	<alpine.LFD.2.00.1106141650520.2142@xanadu.home>
	<201106142342.29405.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201106142342.29405.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2011 at 3:42 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 14 June 2011 23:21:52 Nicolas Pitre wrote:
>> Otherwise, if the revision number is effectively non probable, then I
>> would guess it is the device tree's purpose to carry that information
>> somehow, right? =A0Maybe this can be appended to the board name string?
>
> That's what I meant with adding it to "compatible", which is a list of
> strings with varying degrees of detailed information, e.g.
>
> =A0ti,omap7
> =A0ti,omap7-squirrelboard
> =A0ti,omap7-squirrelboard-v3
> =A0ti,omap7-squirrelboard-v3.17b
>
> You can match the list against a specific revision or a less specific
> identifier if you just want to know whether you are on a squirrelboard
> or a hamsterboard.

Yes, that's generally the right way to handle it.  In practice I've
not seen many cases where it is really required, but it doesn't hurt
if somebody wants to include it in the DT for their board.

g.
