From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Wed, 13 Mar 2013 23:42:33 +0100
Message-ID: <514100D9.1000603@gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <51408FB9.90808@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Rob,

On 03/13/2013 03:39 PM, Rob Herring wrote:
> I fail to see what the hack is. The order of interrupt properties must
> be defined by the binding. interrupt-names is auxiliary data and must
> not be required by an OS.

It is clear that the order of the interrupts must be defined by the
bindings. But how useful <resource>-names properties are when we
cannot define them as required ? If an OS cannot rely on them then
it must use some other, reliable, method to identify the resources,
e.g. by hard coding the indexes. If we have to do it then why even
bother with the <resource>-names properties ? I can see interrupt-names
property specified as required in at least 2 bindings' documentation
and all bindings having reg-names property define it as required.
Are they wrong them ?

Sorry to bother about perhaps obvious things, but I'm really confused
now.

--

Thanks,
Sylwester
