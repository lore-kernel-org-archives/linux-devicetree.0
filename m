From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] sparc: stop exporting openprom.h header
Date: Fri, 8 Oct 2010 13:00:25 -0600
Message-ID: <AANLkTikuaM5VZadCs302HwYYhOHi1Czw2BLam3ZQP=aj@mail.gmail.com>
References: <20101008173650.GH3863@angua.secretlab.ca> <20101008.104557.59696706.davem@davemloft.net>
 <20101008113424.2249c2df@debxo> <20101008.115226.179923658.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20101008.115226.179923658.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: dilinger@queued.net, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 8, 2010 at 12:52 PM, David Miller <davem@davemloft.net> wro=
te:
> From: Andres Salomon <dilinger@queued.net>
> Date: Fri, 8 Oct 2010 11:34:24 -0700
>
>>
>> It's unknown why openprom.h was being exported; there doesn't seem t=
o be any
>> reason for it currently, and it creates headaches with userspace bei=
ng able
>> to potentially use the structures in there. =A0So, don't export it a=
nymore.
>>
>> Signed-off-by: Andres Salomon <dilinger@queued.net>
>
> Acked-by: David S. Miller <davem@davemloft.net>

I suppose it makes sense for me to pick this one up into my tree so it
is grouped with the rest of the pdt patches.  I'll pick it up once
Andres reposts the series.

g.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
