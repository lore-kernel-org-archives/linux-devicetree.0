From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: GIC: Create common infrastructure for GIC DT
 bindings
Date: Fri, 23 Mar 2012 10:55:44 -0600
Message-ID: <4F6CAB10.2020204@wwwdotorg.org>
References: <4bfe7af3761f6f40506a2089fd67866015f6d7f3.1332488625.git.viresh.kumar@st.com>
 <23b4d2ea357a7a785b6c42d0fa7ae9478bad552b.1332488625.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <23b4d2ea357a7a785b6c42d0fa7ae9478bad552b.1332488625.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: devicetree-discuss@ozlabs.org, linux@arm.linux.org.uk, linus.walleij@stericsson.com, arnd@arndb.de, srinidhi.kasagar@stericsson.com, spear-devel@list.st.com, rob.herring@calxeda.com, pawel.moll@arm.com, kgene.kim@samsung.com, viresh.linux@gmail.com, kernel@pengutronix.de, ccross@android.com, olof@lixom.net, jamie@jamieiles.com, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/23/2012 01:49 AM, Viresh Kumar wrote:
> Few platforms define there own struct of_device_id[] for GIC. They don't
> do anything specific in init_irq() other than of_irq_init().
> 
> This patch creates this struct array in gic.c and make other platforms use it.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>

For Tegra,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
