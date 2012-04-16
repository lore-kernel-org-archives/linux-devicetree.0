From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 14:42:38 +0000
Message-ID: <201204161442.38725.arnd@arndb.de>
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
To: Viresh Kumar <viresh.kumar@st.com>
Cc: devicetree-discuss@ozlabs.org, swarren@wwwdotorg.org, linus.walleij@linaro.org, spear-devel@list.st.com, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, viresh.linux@gmail.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 16 April 2012, Viresh Kumar wrote:
> This simplifies cleanup paths of user code by providing managed version of
> of_iomap().
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>


This one looks good,

Acked-by: Arnd Bergmann <arnd@arndb.de>

but I wonder if we should also have a devm_of_request_and_ioremap
(maybe with a shorter name) that combines this with request_resource.

	Arnd
