From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: Booting DT support without U-Boot supporting it
Date: Thu, 12 Apr 2012 09:28:59 +0200
Message-ID: <4F86843B.8080502@de.bosch.com>
References: <4F865817.3000802@st.com>
 <20120412051947.GG2445@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120412051947.GG2445@S2101-09.ap.freescale.net>
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
Cc: spear-devel <spear-devel@list.st.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 12.04.2012 07:19, Shawn Guo wrote:
> On Thu, Apr 12, 2012 at 09:50:39AM +0530, Viresh Kumar wrote:
>> Hi,
>>
>> My U-boot is on an older version and that doesn't have DT support for ARM.
>> Now, is there any way of booting Linux with DT, without U-Boot supporting DT?
>>
> This is how I responded to Fabio on the same query a few hours ago :)
> 
> - Turn on CONFIG_ARM_APPENDED_DTB and CONFIG_ARM_ATAG_DTB_COMPAT
> - cat zImage mx27pdk.dtb > zImage_dtb
> - Boot zImage_dtb as you do with zImage

Just fyi:

http://lists.infradead.org/pipermail/linux-arm-kernel/2012-March/091371.html

http://lists.infradead.org/pipermail/linux-arm-kernel/2012-March/091457.html

Best regards

Dirk
