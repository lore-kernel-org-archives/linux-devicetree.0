From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH v4 7/7] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Tue, 16 Jan 2018 15:28:07 +0100
Message-ID: <d6294ba6-6b65-e463-5695-918b128c71f9@st.com>
References: <1516111941-12635-1-git-send-email-ludovic.Barre@st.com>
 <1516111941-12635-8-git-send-email-ludovic.Barre@st.com>
 <CAK8P3a1AeEY+avU0pKMuVmT=jroYdnJ_eYBvTi5687fzKJHBXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a1AeEY+avU0pKMuVmT=jroYdnJ_eYBvTi5687fzKJHBXQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gerald Baeza <gerald.baeza@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 01/16/2018 03:25 PM, Arnd Bergmann wrote:
> On Tue, Jan 16, 2018 at 3:12 PM, Ludovic Barre <ludovic.Barre@st.com> wrote:
> 
>> +
>> +       aliases {
>> +               serial3 = &uart4;
>> +       };
> 
> Why 'serial3' ? If you have multiple UARTS on this board, just list
> all of them, otherwise
> start with 'serial0'.
> 
>         Arnd
>
sorry, I fix that :-(

BR
Ludo
