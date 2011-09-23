From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] dtc: Add data_append_literal function
Date: Thu, 22 Sep 2011 20:25:50 -0700
Message-ID: <CAF6FioXEh+nACgBV924cPf+MoHUpYdazG8n=JG5dmqSgUu84hg@mail.gmail.com>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
	<1316637731-21872-3-git-send-email-robotboy@chromium.org>
	<20110922023328.GF22223@yookeroo.fritz.box>
	<CAF6FioWE+ybLhXmfw8OUMTXiJ3Hi-ErDai_J63trcahSwSLOag@mail.gmail.com>
	<20110923001345.GA12286@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110923001345.GA12286-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2011 at 5:13 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 22, 2011 at 10:57:58AM -0700, Anton Staaf wrote:
>> On Wed, Sep 21, 2011 at 7:33 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Wed, Sep 21, 2011 at 01:42:10PM -0700, Anton Staaf wrote:
> [snip]
>> >> +
>> >> + =A0 =A0 if ((len < 64) && (value >=3D (1ULL << len)))
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 die("Literal value 0x%x too large to fit in=
 %d-bit cell\n",
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 value, len);
>> >
>> > This really shouldn't be a die(). =A0In general bad input should not
>> > directly trigger a die() during parse - it should give an error but
>> > continue parse as best it can and only drop out afterwards.
>>
>> Hmm, so this check should never happen when called from the
>> parser because the parser uses eval_literal to read the cell values
>> and that function also checks this.
>
> Um.. it checks and prints an error, but it doesn't die() or otherwise
> stop you from reaching here AFAICT.

Hah, yes, you are correct.  The same is true for the other die as well
then I think.

I'll take a closer look tomorrow.

Thanks,
    Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
