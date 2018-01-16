From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 7/7] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Tue, 16 Jan 2018 15:25:03 +0100
Message-ID: <CAK8P3a1AeEY+avU0pKMuVmT=jroYdnJ_eYBvTi5687fzKJHBXQ@mail.gmail.com>
References: <1516111941-12635-1-git-send-email-ludovic.Barre@st.com> <1516111941-12635-8-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516111941-12635-8-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Gerald Baeza <gerald.baeza@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 3:12 PM, Ludovic Barre <ludovic.Barre@st.com> wrote:

> +
> +       aliases {
> +               serial3 = &uart4;
> +       };

Why 'serial3' ? If you have multiple UARTS on this board, just list
all of them, otherwise
start with 'serial0'.

       Arnd
