From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC PATCH 1/5] of: introduce the overlay manager
Date: Wed, 26 Oct 2016 21:02:12 +0200
Message-ID: <20161026210212.09cd85f4@free-electrons.com>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
        <20161026145756.21689-2-antoine.tenart@free-electrons.com>
        <CANLsYkyszsn2TLYhUjHMt2ZnEUmE9eSc71W2KWBL0fWhh3PPBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkyszsn2TLYhUjHMt2ZnEUmE9eSc71W2KWBL0fWhh3PPBw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, pantelis.antoniou@konsulko.com, Mark Rutland <mark.rutland@arm.com>, sboyd@codeaurora.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 26 Oct 2016 10:29:59 -0600, Mathieu Poirier wrote:

> > +       overlay = devm_kzalloc(dev, sizeof(*overlay), GFP_KERNEL);  
> 
> Function devm_kzalloc() can sleep but you're holding a spinlock - I'm
> surprised the kernel didn't complain here.  Allocate the memory before
> holding the lock.  If the overly is already loaded simply free it on
> the error path.

Actually, I'm not sure using a spinlock here is appropriate. Using a
mutex would probably be better.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
