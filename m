From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Wed, 27 Aug 2014 11:26:59 +0200
Message-ID: <53FDA463.8040704@ahsoftware.de>
References: <20140825093931.GB2399@ulmo> <E1XLu15-0002DP-6o@jdl.com> <20140825133714.GH4163@ulmo.nvidia.com> <20140826084208.AE5F0C40989@trevor.secretlab.ca> <20140826084922.GG17263@ulmo> <53FC566C.30904@ahsoftware.de> <20140826102503.GC31124@ulmo> <53FC6513.5040800@ahsoftware.de> <20140826110827.GA31350@ulmo> <53FC6E4A.6030407@ahsoftware.de> <20140826114718.GB641@ulmo> <53FC76E8.5050009@ahsoftware.de> <E1XMHGc-0008TS-CQ@jdl.com> <53FD85C7.4080900@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FD85C7.4080900@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Loeliger <jdl@jdl.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 27.08.2014 09:16, schrieb Alexander Holler:

> Why should I? I've posted patches along with a lot of comments and
> explanations, and e.g. you are just talking that it should be made like
> my patches already did. And others do talk too like my patches and the
> accompanying comments from me which explain most stuff never have
> existed and just repeat what the patches already do without refering to
> them.

Just to repeat myself:

These patches which started this thread are not just some ideas without 
any sense for the amount of work necessary to implement them (as seen so 
often).

These patches are real working code everyone can apply to the mentioned 
kernel version and see what happens with his board. They are even 
checkpatched to avoid bean counting discussion.

(Don't forget to use patch 10/9 too)

Regards,

Alexander Holler
