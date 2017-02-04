From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] Documentation: dt: iio: imu: st_lsm6dsx: add lsm6ds3h
 sensor device binding
Date: Sat, 4 Feb 2017 12:27:32 +0000
Message-ID: <9e16f2c9-936c-a1b9-a36e-dabe5fc89909@kernel.org>
References: <20170129104928.15533-1-lorenzo.bianconi@st.com>
 <20170129104928.15533-6-lorenzo.bianconi@st.com>
 <20170201160604.4vlnxdiot6by5wxd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201160604.4vlnxdiot6by5wxd@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/02/17 16:06, Rob Herring wrote:
> On Sun, Jan 29, 2017 at 11:49:28AM +0100, Lorenzo Bianconi wrote:
>> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This could be combined with patch 3.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Yeah, whilst it's normally one change one patch, this series did
seem to break things up a little excessively!  Perhaps 3 patches would
have be ideal.

1) Supporting refactor of code
2) New device support
3) DT for new devices.

Meh however.  Good easy series for me to handle so I'm happy
anyway ;)

Applied to the togreg branch of iio.git and pushed out as testing.

Chances are high that this is too late for the coming merge windows - all depends
on how fed up Linus is feeling tomorrow!

Jonathan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
