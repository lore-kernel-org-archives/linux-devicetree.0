From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v6 4/9] counter: 104-quad-8: Add Generic Counter
 interface support
Date: Sat, 19 May 2018 09:55:52 -0400
Message-ID: <20180519135539.GA31866@sophia>
References: <881ede525a87ef68fad76cc757ce0ba72df03e5a.1526487615.git.vilhelm.gray@gmail.com>
 <201805192140.de07sSol%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201805192140.de07sSol%fengguang.wu@intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kbuild test robot <lkp@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, benjamin.gaignard@st.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, fabrice.gasnier@st.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, May 19, 2018 at 09:16:55PM +0800, kbuild test robot wrote:
>Hi William,
>
>I love your patch! Perhaps something to improve:
>
>[auto build test WARNING on linus/master]
>[also build test WARNING on v4.17-rc5 next-20180517]
>[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
>url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/Introduce-the-Counter-subsystem/20180519-151353
>reproduce:
>        # apt-get install sparse
>        make ARCH=x86_64 allmodconfig
>        make C=1 CF=-D__CHECK_ENDIAN__
>
>
>sparse warnings: (new ones prefixed by >>)
>
>>> drivers/counter/104-quad-8.c:803:26: sparse: symbol 'quad8_ops' was not declared. Should it be static?
>
>Please review and possibly fold the followup patch.

Ah, yes it should be static -- looks like I made a minor mistake. I'll
squash the fix into the next revision of this patchset.

Thank you,

William Breathitt Gray

>
>---
>0-DAY kernel test infrastructure                Open Source Technology Center
>https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
