From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Fri, 30 Sep 2016 14:55:28 -0700
Message-ID: <20160930215527.GB2373@x250>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20160829095239.GM30790@tiger>
 <AM4PR0401MB22753C87DE074EE7BF456CE48CC10@AM4PR0401MB2275.eurprd04.prod.outlook.com>
 <VI1PR0401MB2638683943A984F9C638F4A88DC10@VI1PR0401MB2638.eurprd04.prod.outlook.com>
 <AM4PR0401MB2275F9FBAE954BD420AA67F98CC10@AM4PR0401MB2275.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM4PR0401MB2275F9FBAE954BD420AA67F98CC10-4rsfagO7TJwHfFjNQjRPfY3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar U <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>
Cc: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pratiyush Srivastava <pratiyush.srivastava-3arQi8VN3Tc@public.gmane.org>, "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, "linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org" <linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 09:13:11PM +0000, Bhaskar U wrote:
> >> >> +&qspi {
> >> >> +	num-cs = <2>;
> >> >> +	bus-num = <0>;
> >> >> +	status = "disabled";
> >> >
> >> >Why is it being disabled?
> >>
> >> Ok, will change like below.
> >> status = "okay";
> >
> >The comment was not "change this to okay".  The question is why is this disabled?
> >Can you explain why it was disabled?   Should it have been disasbled?  Is qspi
> >working and tested on this board?
> 
> The intension of putting the status in disabled state is that the qspi functionality is not tested with the up-streamed kernel.
> Yes qspi is working and tested on this board with 4.1 kernel version.

Please only add those board level device node after it's been tested on
the board.

> >> >> +&esdhc0 {
> >> >> +	status = "disabled";
> >> >
> >> >We prefer to disable devices which have board level options by
> >> >default in <soc>.dtsi, and enable them per availability in <board>.dts.
> >>
> >> Ok , will make the status as okay i.e. status = "okay";
> >
> >Again, the feedback was not "set this to okay".  Why was esdhc0 set to "disabled"
> >here in the first place?  Was there a reason?
> >
> >The comment is that if there are certain boards where esdhc0 is not available,
> >then fsl-ls1012a.dtsi should set this to "disabled" and board .dts files should
> >override it.
> 
> esdhc0 is not there on this board so shall we mark the status in disabled state ?

For device that has pin-out on board, we should mark it disabled in
<soc>.dtsi by default, and enable it in <board>.dts.

> >> >> +&esdhc1 {
> >> >> +	status = "disabled";
> >> >> +};
> >> >> +
> >> >> +&sai2 {
> >> >> +	status = "disabled";
> >> >> +};
> >
> >Same comment for the above nodes.  The fsl-ls1012a.dtsi should set them to
> >disabled and any .dts file should override with "ok" if applicable.
> 
> esdhc1 is not there on the board, so shall we keep the status of esdhc1 in disabled state ?

With esdhc1 being marked "disabled" in <soc>.dtsi by default, we need
to do nothing for board that doesn't have the device.

> sai2 is working and tested on this board, so shall we put the sai2 status as  "okay" ?
> Earlier when we kept sai2 status as disabled, by that time sai2 was not tested but now it is working fine.

With sai2 being marked "disabled" in <soc>.dtsi by default, you add
board level node with "okay" after you test the device working.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
