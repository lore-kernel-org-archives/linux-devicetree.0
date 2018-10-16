From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V13 0/4] C-SKY(csky) Linux Intc Driver
Date: Tue, 16 Oct 2018 15:41:05 +0100
Message-ID: <3fff53d8-fca0-fee4-ae3b-c8b08dc29a37@arm.com>
References: <cover.1539696960.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1539696960.git.ren_guo@c-sky.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Guo,

On 16/10/18 15:08, Guo Ren wrote:
> This is about 13th patchset for C-SKY linux intc drivers and it should pair
> with 9th kernel patchset. Timer drivers are seperated according to
> requirements.
> 
> This version patch improve the comment in commit-msg and move the
> changelog to the end with "---", so git am will ignore the changelog.
> 
> Hope it could be merged into linux-4.20 and I'm very grateful to any help.

I can't really see that happening, in all honesty. On its own, this code
is not very useful (it cannot compile standalone), and I haven't seen a
clear indication that the rest of the architecture code is going to be
merged for 4.20.

If the arch code is actually being merged for 4.20, then please add my:

	Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

to these 4 patches, and get the whole thing merged in one go.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
