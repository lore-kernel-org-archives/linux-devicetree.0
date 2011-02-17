From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Add Samsung's s5pv310 machine with device tree enabled
Date: Thu, 17 Feb 2011 19:41:17 +0530
Message-ID: <AANLkTina6L1sZRTngUu-L4RMvC=p3GM0iq6PRq4VCAe+@mail.gmail.com>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<AANLkTi=JHEc1Kw7rhyE4OOADu5qtPwCtqL-=_FFRoeZL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTi=JHEc1Kw7rhyE4OOADu5qtPwCtqL-=_FFRoeZL-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 17 February 2011 06:09, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Sat, Feb 12, 2011 at 5:46 AM, Thomas Abraham
> <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This patchset adds Samsung's s5pv310 machine with device tree support. T=
his
>> is based on
>>
>> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>>
>> A new machine s5pv310-dt is added along with a dts file for the smdkv310=
 board.
>> Some of the features introduced in this patchset are
>>
>> 1. Tested on smdkv310 board and information such as bootargs, memory inf=
ormation
>> =A0 and console port register defaults are obtained from the device tree.
>> 2. Add basic device tree file for smdkv310 board.
>> 3. Device tree based probe enabled in watchdog timer driver (s3c2410-wdt=
).
>> 4. UART driver modified to obtain default console register values from
>> =A0 device tree.
>
> Thanks Thomas,
>
> I've picked up patches 1-3 into my devicetree/test branch. =A0They still
> require some work, but they are close enough that I'm happy to at
> least have them in my series. =A0You can either send me replacement
> patches as need be, or build on top of devicetree/test.
>
> The remainder I've commented on and I'll leave alone until I get the
> next version.

Thanks for reviewing the patches. I will update the patchset and
submit a newer one.

Thanks,
Thomas.

>
> g.
>
>
> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
>
