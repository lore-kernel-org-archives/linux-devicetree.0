From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 11:06:24 -0600
Message-ID: <CACxGe6t9+M5jQKkRduup7_wk4SKYu1SuTz7wzf0MEvo0poojRw@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
 <201204161442.38725.arnd@arndb.de>
 <CACxGe6tec7y-9VNb9vNiPZhN6bt5MuMV0J18P_7Gk_pDwk-V=Q@mail.gmail.com>
 <CAOh2x=n0NfovyfCpcdoMo2a7yLtb=imm1U+R-1L-2ihZ52FUhw@mail.gmail.com>
 <CACxGe6tZhdvoJ60N8g5-P4UHWxB=699_bA2omEQa77u1hEEPrg@mail.gmail.com>
 <CAOh2x=mptNGkRB-+930Uim=Op9erOxreeTL=3+qfoFeVpWNEYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOh2x=mptNGkRB-+930Uim=Op9erOxreeTL=3+qfoFeVpWNEYQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: viresh kumar <viresh.linux@gmail.com>
Cc: devicetree-discuss@ozlabs.org, Arnd Bergmann <arnd@arndb.de>, swarren@wwwdotorg.org, linus.walleij@linaro.org, spear-devel@list.st.com, Rob Herring <rob.herring@calxeda.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2012 at 10:21 AM, viresh kumar <viresh.linux@gmail.com> wrote:
> On 4/16/12, Grant Likely <grant.likely@secretlab.ca> wrote:
>> It isn't recommended anymore. Use the bus_type specific helpers instead.
>
> Ok. So here is fixup for 3/5 of this patchset.
>
> @Linus: I will merge this with PACH 3/5 and send pull request to Arnd.
>
> fixup! pinctrl: Add SPEAr pinctrl drivers

Cool, thanks.

Now what you *could* do is something like devm_platform_ioremap() that
gets the resource, does request_region() and ioremap().  That would
cut a lot of boilerplate out of drivers.  :-)

g.
