From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] sparc: stop exporting openprom.h header
Date: Fri, 08 Oct 2010 12:02:16 -0700 (PDT)
Message-ID: <20101008.120216.232734365.davem@davemloft.net>
References: <20101008113424.2249c2df@debxo>
	<20101008.115226.179923658.davem@davemloft.net>
	<AANLkTikuaM5VZadCs302HwYYhOHi1Czw2BLam3ZQP=aj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikuaM5VZadCs302HwYYhOHi1Czw2BLam3ZQP=aj-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date: Fri, 8 Oct 2010 13:00:25 -0600

> On Fri, Oct 8, 2010 at 12:52 PM, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:
>> From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
>> Date: Fri, 8 Oct 2010 11:34:24 -0700
>>
>>>
>>> It's unknown why openprom.h was being exported; there doesn't seem to b=
e any
>>> reason for it currently, and it creates headaches with userspace being =
able
>>> to potentially use the structures in there. =A0So, don't export it anym=
ore.
>>>
>>> Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
>>
>> Acked-by: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> =

> I suppose it makes sense for me to pick this one up into my tree so it
> is grouped with the rest of the pdt patches.  I'll pick it up once
> Andres reposts the series.

Yep, that makes sense.
