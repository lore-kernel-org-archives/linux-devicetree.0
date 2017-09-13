From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] DT: net: document Bluetooth bindings in one place
Date: Wed, 13 Sep 2017 11:21:13 -0500
Message-ID: <20170913162113.exrujqwdecq524zf@rob-hp-laptop>
References: <1504637923-21652-1-git-send-email-loic.poulain@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504637923-21652-1-git-send-email-loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 05, 2017 at 08:58:41PM +0200, Loic Poulain wrote:
> From: lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> In the same way as Ethernet, gather the Bluetooth related bindings in
> one file. Introduce the bluetooth-bd-address property which can be used
> to store the assigned BD address.
> 
> Signed-off-by: lpoulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: Set device as unconfigured if default address detected
>      Add warning if BD addr retrieved from DT
>  v3: if no addr retrieved from DT, unconditionally set
>      the invalid BD addr flag.
>      swap and set bdaddr in the platform probe
>  v4: Add dt-bindings documentation
>      split patch in two parts (setup, dt prop)
>      use local-bd-address name instead of local-mac-address
>  v5: remove 2/3 merged in bluetooth-next tree
>      Add bluetooth.txt for common BT bindings
>      expect local-bd-address in little-endian format
> 
>  Documentation/devicetree/bindings/net/bluetooth.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
