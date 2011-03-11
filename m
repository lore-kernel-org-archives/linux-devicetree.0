From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/5] arm/dt: add very basic dts file for babbage board
Date: Fri, 11 Mar 2011 17:10:18 +0800
Message-ID: <AANLkTikVKgZ+ToDO86buCrLzZGUKV7FFBckbCtB7MNtm@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-3-git-send-email-jason.hui@linaro.org>
	<20110311065655.GA2827@S2101-09.ap.freescale.net>
	<AANLkTinRtj1WpAgyPzD2+eHeESMVLZL=ziQvAfZDXb87@mail.gmail.com>
	<20110311083502.GB2827@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110311083502.GB2827-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Fri, Mar 11, 2011 at 4:36 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Fri, Mar 11, 2011 at 03:33:24PM +0800, Jason Hui wrote:
>> Hi, Shawn,
[...]
>>
>> No, I don't think so. Where the section is put is not one strict rule,
>> take a look at
>> powerpc dts file, you will see that.
>>
> Maybe I did not make my point clear. =A0I would try it one more time.
> Let's see this virtual example.
>
[...]
>> I don't see what's wrong with eCSPI and SSI when put spba behind aips
>> just like uart.
>
> Sorry. =A0Allow me correct the point here. =A0eCSPI is not the example I
> intended to put. =A0Let's see SSI below. =A0You do not get the correct
> order anyway, either you put spba@70000000 before or after
> aips@83f00000, unless you split the aips@83f00000 section into
> mulitples, which again I'm not sure if we should go for.
>
[...]
> It does not matter at all whether you take my comments or not. =A0The
> thing matters is if we have the solution working for all the possible
> cases.

I know your meanings from the beginning. The case is that,  There always
will be solution for this case. I will adjust it when I met such issue in-d=
eed.
for example when adding SSI support at that time.
I don't want to make things complex here for the basic DT support.

BR,
Jason.

>
> --
> Regards,
> Shawn
>
>
