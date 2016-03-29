From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] regulator: core: Allow use of "status =
 disabled" in regulator dts nodes
Date: Tue, 29 Mar 2016 11:57:11 +0200
Message-ID: <20160329095711.GI30977@lukather>
References: <1457730069-31760-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FJhvIAWe7X2mSp4a"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB6FC5G3QKGQERL5RU4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1457730069-31760-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--FJhvIAWe7X2mSp4a
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Mark,

On Fri, Mar 11, 2016 at 10:01:07PM +0100, Hans de Goede wrote:
> The axp20x and axp22x pmics have ldo regulators which are muxed to the
> outside via gpio pins. Unfortunately regulator enable / disable is
> implemented in the hardware via selecting a specific pin-mux option.
> 
> So if we want to use these pins as gpio pins we must not register
> a regulator for these pins at all, otherwise any gpio use (switching
> to input, or writing a value) gets undone when the regulator subsys
> disables unused regulators at the end of kernel-init.
> 
> This commits allows the use of  "status = disabled" in regulator dts
> nodes and makes regulator_register return ENODEV when this is set.
> 
> Note that this commit changes the loop to find the of-node in
> regulator_of_get_init_data from using for_each_available_child_of_node
> to using for_each_child_of_node. regulator_register is the only user
> of regulator_of_get_init_data and the use of for_each_available_child...
> makes little sense there since this will only cause the constraints
> from regulator dts nodes marked as disabled to not be used, the
> actual registration of the regulator would still continue.
> 
> So in a way this patch could be seen as a bugfix as it actually makes
> regulators with an of_node which is marked as not available not register,
> but this behavior change may cause some issues in some places.
> 
> Note that individual regulator drivers / callers of regulator_register
> which may encounter disabled regulator (child) nodes need to be patched to
> handle ENODEV (to not make it fail their probe method).
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Any comments on this one?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--FJhvIAWe7X2mSp4a--
