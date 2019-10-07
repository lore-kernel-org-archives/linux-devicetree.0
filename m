From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: adi: Fix yaml verification issue
Date: Mon, 7 Oct 2019 16:07:17 +0200
Message-ID: <01041a6b-7c70-bebd-d04b-9e47ce238e5e@st.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com>
 <20191007102552.19808-3-alexandre.torgue@st.com>
 <CAL_JsqKFUTwjJefQvQE5aFmeJButYSLKm0RSpCHjSL=7pQHtxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKFUTwjJefQvQE5aFmeJButYSLKm0RSpCHjSL=7pQHtxQ@mail.gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandru Ardelean <alexaundru.ardelean@analog.com>, netdev <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

On 10/7/19 3:56 PM, Rob Herring wrote:
> On Mon, Oct 7, 2019 at 5:26 AM Alexandre Torgue <alexandre.torgue@st.com> wrote:
>>
>> This commit fixes an issue seen during yaml check ("make dt_binding_check").
>> Each enum were not declared as uint32.
>>
>> "Documentation/devicetree/bindings/net/adi,adin.yaml:
>> properties:adi,rx-internal-delay-ps:
>> ..., 'enum': [1600, 1800, 2000, 2200, 2400], 'default': 2000}
>> is not valid under any of the given schemas"
> 
> You need to update dtschema. I fixed this in the meta-schema last
> week. Any property with a standard property unit suffix has a defined
> type already, so we don't need to define it again here.
> 
> I also added '-bits' to standard units.

Nice, I'm going to update my tools.

thanks
Alex

> 
> Rob
> 
