From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 11:27:29 +0200
Message-ID: <CACRpkdbLM8-3qVU7r8XiaHYKZtYDKPRT1tAoKCsJmGBq7+XoLw@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@st.com>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@ozlabs.org, arnd@arndb.de, swarren@wwwdotorg.org, spear-devel@list.st.com, Grant Likely <grant.likely@secretlab.ca>, viresh.linux@gmail.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2012 at 6:13 AM, Viresh Kumar <viresh.kumar@st.com> wrote:

> This simplifies cleanup paths of user code by providing managed version of
> of_iomap().
>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Let's CC Rob Herring on this too in order not to overload Grant...

Yours,
Linus Walleij
