From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: [PATCH 1/2] ARM: VIC: Create common infrastructure for vic DT
 bindings
Date: Sun, 25 Mar 2012 13:01:32 +0530
Message-ID: <CAOh2x=n-sZ6jV1M9XY9cOp7_8EeRfvqkjL5y3AakgpYymFRHkg@mail.gmail.com>
References: <4bfe7af3761f6f40506a2089fd67866015f6d7f3.1332488625.git.viresh.kumar@st.com>
 <4F6C6F32.10800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F6C6F32.10800@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@ozlabs.org, linux@arm.linux.org.uk, linus.walleij@stericsson.com, pawel.moll@arm.com, srinidhi.kasagar@stericsson.com, spear-devel@list.st.com, rob.herring@calxeda.com, kgene.kim@samsung.com, arnd@arndb.de, kernel@pengutronix.de, ccross@android.com, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2012 at 6:10 PM, Rob Herring <robherring2@gmail.com> wrote:
> NAK
>
> None of these platforms have gpio interrupts or any other board
> interrupt controllers which need to be initialized early?

Atleast SPEAr600 have GPIO interrupts.

> I don't think DT conversions are complete enough to tell.

Couldn't get your comment, sorry.

> We could do something like this, but there only needs to be a single
> match list of all controllers and function. We should consolidate the
> irqchips to drivers/irqchip first though. I have that action from Connect...

That would be good.
I am updating DT support for SPEAr3xx, where i need to use VIC OF
support. So i would still like to get this patch going and you can consilidate
code at irqchips level later. What do you say?

--
viresh
