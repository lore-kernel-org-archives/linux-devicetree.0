From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM/arm64: sunxi: convert CCU raw
 numbers to macros
Date: Mon, 5 Jun 2017 16:17:06 +0800
Message-ID: <CAGb2v66eV4cX-w1ZBNRGrkJ8HNv0HY0ei2bZ7T+=zwTHhVkRew@mail.gmail.com>
References: <20170605043224.20687-1-wens@csie.org> <20170605081423.sx7qqjq73646enlm@flea.lan>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGVH2TEQKGQECSK2COI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170605081423.sx7qqjq73646enlm-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 4:14 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Jun 05, 2017 at 12:32:22PM +0800, Chen-Yu Tsai wrote:
>> Hi Maxime,
>>
>> These are some clean up patches for 4.12. They convert raw number
>> references for the CCU and R_CCU nodes, from when the CCU/R_CCU stuff
>> was first added, to the defined macros in the device tree header files.
>>
>> These affect the A64 and H3/H5.
>>
>> These are based on our sunxi/fixes-for-4.12 branch. Once these are merged,
>> I think it's time to send off pull requests for our fixes branches.
>>
>> ChenYu
>
> Applied both, thanks!
> Maxime

Argh... Could you fix the build break on patch 1? It's simply

    sed -i -e 's/RST_IR/RST_APB0_IR/' arch/arm/boot/dts/sunxi-h3-h5.dtsi

Thanks
ChenYu
