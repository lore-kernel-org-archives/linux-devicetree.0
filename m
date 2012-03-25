From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: [PATCH] mtd: spear-smi: Update compatible property
Date: Sun, 25 Mar 2012 12:55:45 +0530
Message-ID: <CAOh2x=kjaSzBJf6QMrPXLggEdE5ioY1=KtBX2B6f9Pf+ujwNYw@mail.gmail.com>
References: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
 <4F6C8451.1020005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <4F6C8451.1020005@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Viresh Kumar <viresh.kumar@st.com>, devicetree-discuss@ozlabs.org, artem.bityutskiy@linux.intel.com, spear-devel@list.st.com, linux-mtd@lists.infradead.org, sr@denx.de
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2012 at 7:40 PM, Rob Herring <robherring2@gmail.com> wrote:
> On 03/23/2012 03:48 AM, Viresh Kumar wrote:
>> SPEAr SMI controller version is same for all SPEAr machines. Thus we don't need
>> per machine compatible property in driver.
>
> Until the next chip...

Sorry couldn't get you point here.

>> Thus this patch updates compatible entry to: "st,spear-smi", so that it
>> works for all SPEAr machines.
>
> There is no reason all machines can't use "st,spear600-smi" in their
> dts. It doesn't have to be a spear600, just compatible with it. Really
> you want the string to be the oldest SOC the block is in and then newer
> SOCs can claim compatibility with the old version.

Got your point. But actually as we just had smi DT support patch recently,
so we can name it better right now. In future, i agree with your point.

> This is also bad that you would break any existing dtb's out there. This
> is probably not a concern yet since it's all new and in transition, but
> down the road this is something that can't be done.

Yes i agree. Actually i had patch for spear600-evb.dts ready with me, but
just wanted to have inputs on this change before posting the complete
patchset.

Would post both patches again, with my 3xx DT support.

--
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
