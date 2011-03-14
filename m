From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 14 Mar 2011 13:33:55 +0800
Message-ID: <AANLkTinWPQDLL7B5HfJBZnBegSO9UBTAKeR5Bih6u-FM@mail.gmail.com>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<201103101338.45187.arnd@arndb.de>
	<AANLkTi=3cXtnZA+8JW5+-OjjpJBC4SL26NoAMpnrgWmy@mail.gmail.com>
	<201103111310.43339.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201103111310.43339.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Arnd,

On Fri, Mar 11, 2011 at 8:10 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 11 March 2011, Jason Hui wrote:
>> >> Alternatively, it could be done the other way round: rename the ident=
ifiers
>> >> in the file from mx51_ to mx5_, and make sure that they don't contain
>> >> any mx51 specific settings but always refer to properties in the
>> >> device tree for the differences.
>> >
>> > I saw that your V4 still implements neither Shawn's suggestion nor min=
e.
>>
>> As you said, I don't want to make thing complex too. I don't want to
>> have mx51_dt or
>> mx53_dt as Shawn Suggests and I still don't want to make it change to
>> mx5 now as you suggest
>> Since this patch only support mx51 currently. I think it's easy to
>> make change later once mx53 in-deed
>> added in DT support, what do you think?
>
> It would also be easy to rename the file from mx51_dt to board_dt
> when it becomes more generic. I don't consider it a show-stopper
> though and am comfortable with leaving it to your own judgement.

Thanks for the comments. I will keep as it's now.

>
> Generally speaking, you don't have to do everything that reviewers
> suggest, but please reply to explain your reasons if you disagree.

Yes, correct. :)

>
> =A0 =A0 =A0 =A0Arnd
>
